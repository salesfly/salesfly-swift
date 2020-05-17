//
//  Multipart.swift
//  Swift client for Salesfly API 
//
//  Copyright © 2018-20 UAB Salesfly. All rights reserved.
//

import Foundation

class Multipart : NSObject {

    // Encode multipart/form-data
    // Returns (body, headers)
    func encode(fields: [String:Any], files: [String]) throws -> (Data?, [String:String]) {
        var body = Data()
        let boundary = self.generateBoundary()

        // Fields
        for (key, value) in fields {
            if let v = value as? NSArray {
                for (item) in v {
                    let name = self.escapeQuote(value: key)
                    let marker = "--\(boundary)\r\nContent-Disposition: form-data; name=\"\(name)\"\r\n\r\n\(item)\r\n"  
                    body.append(_: marker.data(using: .utf8, allowLossyConversion: false)!)
                }
            } else {
                let name = self.escapeQuote(value: key)
                let marker = "--\(boundary)\r\nContent-Disposition: form-data; name=\"\(name)\"\r\n\r\n\(value)\r\n"   
                body.append(_: marker.data(using: .utf8, allowLossyConversion: false)!)
            }            
        }

        // Files
        for (fn) in files {
            let url = URL(fileURLWithPath: fn)
            let name = url.lastPathComponent
            let contentType = MimeType(url: url).value
            print(contentType)
            let fileName = self.escapeQuote(value: fn)

            let marker = "--\(boundary)\r\nContent-Disposition: form-data; name=\"\(name)\"; filename=\"\(fileName)\"\r\nContent-Type: \(contentType)\r\n\r\n" 
            body.append(_: marker.data(using: .utf8, allowLossyConversion: false)!)

            let content = try Data(contentsOf: url, options: [.alwaysMapped, .uncached ])
            body.append(content)

            let nl = "\r\n"  
            body.append(_: nl.data(using: .utf8, allowLossyConversion: false)!)
        }

        // End marker
        let marker = "--\(boundary)--\r\n"   
        body.append(_: marker.data(using: .utf8, allowLossyConversion: false)!)

        // Headers
        let headers = [
            "Content-Type": "multipart/form-data; boundary=" + boundary,
            "Content-Length": "\(body.count)" 
        ]

        return (body, headers)
    }


    private func generateBoundary() -> String {
        let length = 32
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomCharacters = (0..<length).map{_ in characters.randomElement()!}
        return String(randomCharacters)    
    }

    private func escapeQuote(value: String) -> String {
        return value.replacingOccurrences(of: "\"", with: "\\\"")
    }

}