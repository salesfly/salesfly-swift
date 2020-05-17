//
//  Usage.swift
//  Swift client for Salesfly API
//
//  Copyright © 2018-20 UAB Salesfly. All rights reserved.
//
import Foundation

public struct Usage {
    public static func get() throws -> APIUsage? {
        let restClient = try SalesflyClient.getRestClient()
        let data = try restClient.get(path: "/v1/usage")
        let resp = try JSONDecoder().decode(Response<APIUsage>.self, from: data!)
        return resp.data
    }
}