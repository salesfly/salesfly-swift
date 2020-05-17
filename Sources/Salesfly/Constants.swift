//
//  Constants.swift
//  Swift client for Salesfly API 
//
//  Copyright © 2018-20 UAB Salesfly. All rights reserved.
//

import Foundation

public struct Constants {
    public static let API_BASE_URL: String = "https://api.salesfly.com"
    public static let VERSION: String = "1.0.0"
    public static let USER_AGENT: String = "salesfly-swift/" + VERSION
    public static let DEFAULT_TIMEOUT: TimeInterval = 30.0 // seconds
}
