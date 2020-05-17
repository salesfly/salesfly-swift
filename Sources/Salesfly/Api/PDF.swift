//
//  PDF.swift
//  Swift client for Salesfly API
//
//  Copyright © 2018-20 UAB Salesfly. All rights reserved.
//
import Foundation

public struct PDF {
    public static func create(options: PDFOptions) throws -> Data? {
        let headers = [
            "Accept": "application/pdf",
        ]        
        let restClient = try SalesflyClient.getRestClient()

//        let payload = jsonToData(json: options)

        let payload = try? JSONSerialization.data(withJSONObject: options.asDictionary)


        let data = try restClient.post(path: "/v1/pdf/create", payload: payload, headers: headers)
        return data
        //let resp = try JSONDecoder().decode(Response<APIUsage>.self, from: data!)
        //return resp.data
    }


  /*  public static func jsonToData(json: AnyObject) -> Data? { 
        do {
            return try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) as Data
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil;
    }

*/

}