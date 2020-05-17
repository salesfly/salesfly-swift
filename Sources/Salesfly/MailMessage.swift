//
//  MailMessage.swift
//  Swift client for Salesfly API 
//
//  Copyright © 2018-20 UAB Salesfly. All rights reserved.
//

import Foundation

public struct MailMessage: Codable {
    public var from: String
    public var to: [String]
    public var subject: String
    public var text: String
    public var date: Date?
    public var html: String?
    public var attachments: [String]
    public var fromName: String?
    public var replyTo: String?
    public var cc: [String]
    public var bcc: [String]
    public var charset: String?
    public var encoding: String?
    public var tags: [String]

    public var requireTLS: Bool?
    public var verifyCertificate: Bool?
    public var openTracking: Bool?
    public var clickTracking: Bool?
    public var plainTextClickTracking: Bool?
    public var unsubscribeTracking: Bool?
    public var testMode: Bool?

    public init(from: String, to: [String], subject: String, text: String) {        
        // Mandatory:
        self.from = from
        self.to = to
        self.subject = subject
        self.text = text

        // Optional:
        self.date = nil
        self.replyTo = nil
        self.html = nil
        self.fromName = nil
        self.attachments = [String]()
        self.cc = [String]()
        self.bcc = [String]()
        self.charset = nil
        self.encoding = nil
        self.tags = [String]()

        self.requireTLS = nil
        self.verifyCertificate = nil
        self.openTracking = nil
        self.clickTracking = nil
        self.plainTextClickTracking = nil
        self.unsubscribeTracking = nil
        self.testMode = nil
    }   

    var asDictionary: [String: Any] {
        // All fields except attachments
        var dict: [String: Any] = [
            "from": from,
            "to": to,
            "subject": subject,
            "text": text,
        ]

        if date != nil {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            formatter.locale = Locale(identifier: "en_US_POSIX")
            dict["date"] = formatter.string(from: date!)
        }

        if fromName != nil {
            dict["from_name"] = fromName
        }

        if replyTo != nil {
            dict["reply_to"] = replyTo
        }

        if html != nil {
            dict["html"] = html
        }

        if cc.count > 0 {
            dict["cc"] = cc
        }
        if bcc.count > 0 {
            dict["bcc"] = bcc
        }

        if charset != nil {
            dict["charset"] = charset
        }
        if encoding != nil {
            dict["encoding"] = encoding
        }

        if tags.count > 0 {
            dict["tags"] = tags
        }

        // Options:
        if requireTLS != nil {
            dict["require_tls"] = requireTLS
        }
        if verifyCertificate != nil {
            dict["verify_cert"] = verifyCertificate
        }
        if openTracking != nil {
            dict["open_tracking"] = openTracking
        }
        if clickTracking != nil {
            dict["click_tracking"] = clickTracking
        }
        if plainTextClickTracking != nil {
            dict["text_click_tracking"] = plainTextClickTracking
        }
        if unsubscribeTracking != nil {
            dict["unsubscribe_tracking"] = unsubscribeTracking
        }
        if testMode != nil {
            dict["test_mode"] = testMode
        }

        return dict
    }

}