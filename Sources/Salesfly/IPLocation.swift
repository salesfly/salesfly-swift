//
//  IPLocation.swift
//  Swift client for Salesfly API
//
//  Copyright © 2018-20 UAB Salesfly. All rights reserved.
//
import Foundation

public struct IPCurrency : Decodable {
    public var code: String?
    public var numericCode: String?   
    public var name: String?          
    public var pluralName: String?    
    public var symbol: String?        
    public var nativeSymbol: String? 
    public var decimalDigits: Int?    

    private enum CodingKeys : String, CodingKey {
        case code            
        case numericCode = "num_code"
        case name
        case pluralName = "name_plural"                
        case symbol
        case nativeSymbol = "symbol_native"        
        case decimalDigits = "decimal_digits"        
    }
}

public struct IPLanguage : Decodable {
    public var code: String?
    public var code2: String?   
    public var name: String?          
    public var nativeName: String? 
    public var rtl: Bool?    

    private enum CodingKeys : String, CodingKey {
        case code            
        case code2 = "code2"
        case name
        case nativeName = "native_name"                
        case rtl
    }
}

public struct IPTimezone : Decodable {
    public var id: String?
    public var localTime: String?   
    public var gmtOffset: Int?          
    public var code: String?        
    public var daylightSaving: Bool? 

    private enum CodingKeys : String, CodingKey {
        case id
        case localTime = "localtime"
        case gmtOffset = "gmt_offset"                
        case code            
        case daylightSaving = "daylight_saving"        
    }
}

public struct IPSecurity : Decodable {
    public var isProxy: Bool?
    public var proxyType: String?
    public var isCrawler: Bool?
    public var crawlerName: String?
    public var crawlerType: String?
    public var isTOR: Bool?
    public var threatLevel: String?
    public var threatTypes: [String]?
    private enum CodingKeys : String, CodingKey {
        case isProxy = "is_proxy"
        case proxyType = "proxy_type"
        case isCrawler = "is_crawler"
        case crawlerName = "crawler_name"
        case crawlerType = "crawler_type"
        case isTOR = "is_tor"
        case threatLevel = "threat_level"
        case threatTypes = "threat_types"
    }
}

public struct IPLocation : Decodable {
    public var ipAddress: String?         
    public var type: String?   // ipv4 or ipv6       
    public var hostname: String?                
	public var continent: String?            
	public var continentCode: String?        
    public var country: String?              
    public var countryNative: String?        
    public var countryCode: String? 
    public var countryCode3: String?         
	public var capital: String?              
	public var region: String?                  
	public var regionCode: String?              
	public var city: String?                     
	public var postcode: String?                 
	public var latitude: Double? = 0.0              
	public var longitude: Double? = 0.0
	public var phonePrefix: String?             
    public var flag: String?                    
	public var flagEmoji: String?               
    public var isEU: Bool? = false
	public var tld: String?                     
    public var currencies: [IPCurrency]?
    public var languages: [IPLanguage]?
    public var timezone: IPTimezone?
    public var security: IPSecurity? 

    private enum CodingKeys : String, CodingKey {
        case ipAddress = "ip"         
        case type
        case hostname                
        case continent            
        case continentCode = "continent_code"        
        case country = "country_name"    
        case countryNative = "country_name_native"        
        case countryCode = "country_code" 
        case countryCode3 = "country_code3"         
        case capital              
        case region = "region_name"                  
        case regionCode = "region_code"              
        case city                     
        case postcode                 
        case latitude
        case longitude
        case phonePrefix = "phone_prefix"             
        case flag                    
        case flagEmoji = "flag_emoji"               
        case isEU = "is_eu"
        case tld = "internet_tld"                     
        case currencies
        case languages
        case timezone
        case security 
    }
}