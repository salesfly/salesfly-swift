//
//  SalesflyClient.swift
//  Swift client for Salesfly API 
//
//  Copyright © 2018-20 UAB Salesfly. All rights reserved.
//

import Foundation

public class SalesflyClient {
    static var apiKey: String?
    static var timeout: TimeInterval?
    static var restClient: RestClient?

    // Prevent class instantiation
    fileprivate init() {}

    /**
     Initializes the Salesfly API client.
     - parameters:
        - apiKey: The API key.
        - timeout: The connection timeout in seconds.
     - throws:
        - `SalesflyError.missingArgument` if no API is provided.
        - `SalesflyError.notInitialized` if rest client is used before initialized.
    */
    public static func initialize(apiKey: String, timeout: TimeInterval = Constants.DEFAULT_TIMEOUT) throws {
        try SalesflyClient.setApiKey(apiKey: apiKey)
        SalesflyClient.setTimeout(timeout: timeout)
    }

    public static func setApiKey(apiKey: String) throws {
        if apiKey.isEmpty {
           throw SalesflyError.missingArgument(reason: "No API key provided")
        }
        if apiKey != SalesflyClient.apiKey {
            SalesflyClient.invalidate()
        }
        SalesflyClient.apiKey = apiKey
    }

    public static func setTimeout(timeout: TimeInterval) {
        if timeout != SalesflyClient.timeout {
            SalesflyClient.invalidate()
        }
        SalesflyClient.timeout = timeout
    }

    public static func getRestClient() throws -> RestClient {
        if SalesflyClient.restClient != nil {
            return SalesflyClient.restClient!
        }
        if SalesflyClient.apiKey == nil {
           throw SalesflyError.notInitialized(reason: "Client was used before ApiKey was set, please call SalesflyClient.initialize() first")
        }
        SalesflyClient.restClient = RestClient(apiKey: SalesflyClient.apiKey!, timeout: SalesflyClient.timeout!)
        return SalesflyClient.restClient!
    }

    public static func setRestClient(restClient: RestClient) {
        SalesflyClient.restClient = restClient
    }

    public static func invalidate() {
        SalesflyClient.restClient = nil
    }

    public static func getVersion() -> String {
        return Constants.VERSION
    }
}