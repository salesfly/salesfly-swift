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

        let data = try restClient.post(path: "/v1/pdf/create", payload: options.toData(), headers: headers)
        return data
    }
}