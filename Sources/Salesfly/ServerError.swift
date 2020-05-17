//
//  ServerError.swift
//  Swift client for Salesfly API 
//
//  Copyright © 2018-20 UAB Salesfly. All rights reserved.
//

import Foundation

public struct ServerError {
    static func compose(statusCode: Int) -> Error {
        switch statusCode {
            case 502:
                return SalesflyError.badGateway(reason: "Bad gateway", code: "err-bad-gateway")
            case 503:
                return SalesflyError.serviceUnavailable(reason: "Service unavailable", code: "err-service-unavailable")
            default:
                return SalesflyError.serverError(reason: "Internal server error", code: "err-server-error")
        }
    }
}
