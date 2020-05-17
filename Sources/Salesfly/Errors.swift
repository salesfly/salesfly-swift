//
//  Errors.swift
//  Swift client for Salesfly API 
//
//  Copyright © 2018-20 UAB Salesfly. All rights reserved.
//

public enum SalesflyError : Error {
  //--- General
  case missingArgument(reason: String)
  case notInitialized(reason: String)
  case invalidURL(reason: String)
  //--- 4xx
  case badRequest(reason: String, code: String) // 400
  case unauthorized(reason: String, code: String) // 401
  case forbidden(reason: String, code: String) // 403
  case notFound(reason: String, code: String) //404
  case tooManyRequests(reason: String, code: String) //429
  //--- 5xx
  case serverError(reason: String, code: String) // 500
  case badGateway(reason: String, code: String) // 502
  case serviceUnavailable(reason: String, code: String) // 503
}

