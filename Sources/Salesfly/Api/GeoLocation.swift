//
//  GeoLocation.swift
//  Swift client for Salesfly API
//
//  Copyright © 2018-20 UAB Salesfly. All rights reserved.
//
import Foundation

public struct GeoLocation {

    public static func get(ip: String, fields: String? = nil, hostname: Bool = false, security: Bool = false) throws -> IPLocation? {
        let restClient = try SalesflyClient.getRestClient()
        let query = makeQuery(fields: fields, hostname: hostname, security: security)
        let data = try restClient.get(path: "/v1/geoip/" + ip + query)
        let resp = try JSONDecoder().decode(Response<IPLocation>.self, from: data!)
        return resp.data
    }

    public static func getCurrent(fields: String? = nil, hostname: Bool = false, security: Bool = false) throws -> IPLocation? {
        return try GeoLocation.get(ip: "myip", fields: fields, hostname: hostname, security: security)
    }

    public static func getBulk(ipList: [String], fields: String? = nil, hostname: Bool = false, security: Bool = false) throws -> [IPLocation]? {
        let restClient = try SalesflyClient.getRestClient()
        let ips = ipList.joined(separator: ",")
        let query = makeQuery(fields: fields, hostname: hostname, security: security)
        let data = try restClient.get(path: "/v1/geoip/" + ips + query)
        let resp = try JSONDecoder().decode(Response<[IPLocation]>.self, from: data!)
        return resp.data
    }

    private static func makeQuery(fields: String? = nil, hostname: Bool = false, security: Bool = false) -> String {
        var result: String = ""
        if (fields != nil) {
            result += "?fields=" + fields!
        }
        if (hostname) {
            result += result.count == 0 ? "?" : "&"
            result += "hostname=true"
        }
        if (security) {
            result += result.count == 0 ? "?" : "&"
            result += "security=true"
        }
        return result
    }
}