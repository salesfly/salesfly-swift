//
//  Response.swift
//  Swift client for Salesfly API 
//
//  Copyright © 2018-20 UAB Salesfly. All rights reserved.
//

import Foundation

struct Response<T: Decodable> : Decodable {
    var status: Int
    var success: Bool
    var message: String?
    var code: String?
    var data: T?
}
