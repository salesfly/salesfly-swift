//
//  APIUsage.swift
//  Swift client for Salesfly API
//
//  Copyright © 2018-20 UAB Salesfly. All rights reserved.
//
import Foundation

public struct APIUsage : Decodable {
    public var allowed: Int
    public var used: Int

    private enum CodingKeys : String, CodingKey {
        case allowed = "allowed"
        case used = "used"
    }
}