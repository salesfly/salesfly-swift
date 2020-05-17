//
//  Mail.swift
//  Swift client for Salesfly API
//
//  Copyright © 2018-20 UAB Salesfly. All rights reserved.
//

import Foundation

public struct Mail {
    public static func send(message: MailMessage) throws -> MailReceipt? {
        let restClient = try SalesflyClient.getRestClient()
        let multipart = Multipart()
        let (payload, headers) = try multipart.encode(fields: message.asDictionary, files: message.attachments)
        let data = try restClient.post(path: "/v1/mail/send", payload: payload, headers: headers)
        let resp = try JSONDecoder().decode(Response<MailReceipt>.self, from: data!)
        return resp.data
    }
}