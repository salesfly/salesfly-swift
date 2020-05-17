//
//  MailReceipt.swift
//  Swift client for Salesfly API 
//
//  Copyright © 2018-20 UAB Salesfly. All rights reserved.
//

import Foundation

public struct MailReceipt : Decodable {
    public var id: String
    public var acceptedRecipients: Int
    public var rejectedRecipients: Int

    private enum CodingKeys : String, CodingKey {
        case id = "id"
        case acceptedRecipients = "accepted_recipients"
        case rejectedRecipients = "rejected_recipients"
    }
}

