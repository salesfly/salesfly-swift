//
//  ResponseError.swift
//  Swift client for Salesfly API 
//
//  Copyright © 2018-20 UAB Salesfly. All rights reserved.
//

import Foundation

public struct ResponseError : Decodable {
    static func compose(from data: Data, statusCode: Int) -> Error {
        do {
            let resp = try JSONDecoder().decode(Response<ResponseError>.self, from: data)
            switch (statusCode) {
                case 401:
                    return SalesflyError.unauthorized(reason: resp.message!, code: resp.code!)
                case 403:
                    return SalesflyError.forbidden(reason: resp.message!, code: resp.code!)
                case 404:
                    return SalesflyError.notFound(reason: resp.message!, code: resp.code!)
                case 429:
                    return SalesflyError.tooManyRequests(reason: resp.message!, code: resp.code!)
                default:    
                    return SalesflyError.badRequest(reason: resp.message!, code: resp.code!)
            }
        } catch {
            print("Unable to parse error")
            return error
        }
    }
}
