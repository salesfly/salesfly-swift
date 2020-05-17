//
//  PDFOptions.swift
//  Swift client for Salesfly API 
//
//  Copyright © 2018-20 UAB Salesfly. All rights reserved.
//

import Foundation

public struct PDFOptions: Codable {
    /// A URL pointing to a web page. 
    public var documentURL : String?

    /// A string containing HTML.
    public var documentHTML : String?

    /// Name of the returned document. Defaults to 'document.
    public var documentName : String?

    /// Top margin, accepts values labeled with units. Example: '20mm'.
    public var marginTop : String?

    /// Bottom margin, accepts values labeled with units.                              
    public var marginBottom : String?

    /// Left margin, accepts values labeled with units.                             
    public var marginLeft : String?

    /// Right margin, accepts values labeled with units.           
    public var marginRight : String?

    /// Paper orientation: 'landscape' or 'portrait'. Defaults to 'portrait'. 
    public var orientation : String?

    /// Paper format. Defaults to 'A4'.
    public var pageFormat : String?

    /// Paper width, accepts values labeled with units. If set together with PageHeight, takes priority over PageFormat. 
    public var pageWidth : String?

    /// Paper height, accepts values labeled with units. If set together with PageWidth, takes priority over PageFormat.
    public var pageHeight : String?

    /// Paper ranges to print, e.g., '1-5, 8, 11-13'. Defaults to the empty string, which means print all pages.
    public var pageRanges : String?

    /// Scale of the webpage rendering. Defaults to 1. Scale amount must be between 0.1 and 2.                        
    public var scale : Double?

    /// Header text to be displayed at the top of each page.   
    public var headerText : String?

    /// Header alignment: 'left', 'center' or 'right'. Defaults to 'center. 
    public var headerAlign : String?

    /// Left and right margin for header (only applied when using HeaderText).
    public var headerMargin : Int?

    /// HTML template for the header. 
    public var headerHTML : String?

    /// A URL pointing to a HTML template for the header.   
    public var headerURL : String?

    /// Footer text to be displayed at the bottom of each page. 
    public var footerText : String?

    /// Footer alignment: 'left', 'center' or 'right'. Defaults to 'center. 
    public var footerAlign : String?

    /// Left and right margin for footer (only applied using FooterText). 
    public var footerMargin : Int?

    /// HTML template for the footer. 
    public var footerHTML : String?

    /// A URL pointing to a HTML template for the footer. 
    public var footerURL : String?

    /// Print background graphics. Defaults to false.  
    public var printBackground : Bool?

    /// Give any CSS @page size declared in the page priority over what is declared in `width` and `height` or `format` options. Defaults to false, which will scale the content to fit the paper size. 
    public var preferCSSPageSize : Bool?

    /// A URL pointing to a PNG or JPEG image that will be used as a watermark.
    public var watermarkURL : String?

    /// A string telling where to place the watermark on the page: 'topleft', 'topright', 'center', 'bottomleft', 'bottomright'. Defaults to 'center'. 
    public var watermarkPosition : String?

    /// The number of pixels to shift the watermark image horizontally. Offset is given in pixels. Defaults to 0.
    public var watermarkOffsetX : Int?

    /// The number of pixels to shift the watermark image vertically. Offset is given in pixels. Defaults to 0.    
    public var watermarkOffsetY : Int?

    /// The title of this document.  
    public var title : String?

    /// The author of this document.  
    public var author : String?

    /// The creator of this document. 
    public var creator : String?

    /// The subject of this document. 
    public var subject : String?

    /// An array of keywords associated with this document. 
    public var keywords : [String]

    /// A RFC 3066 language-tag denoting the language of this document, or an empty string if the language is unknown.
    public var language : String?

    /// Encrypt the PDF document using one of following algorithms: 'aes-256', 'aes-128', 'rc4-128' or 'rc4-40'.
    public var encryption : String?

    /// Set the owner password (required when encryption is enabled).
    public var ownerPassword : String?

    /// Set the user password. 
    public var userPassword : String?

    /// Set user permissions 'all' or 'none'. Defaults to 'all'.  
    public var permissions : String?

    public init() {        
        self.documentURL = nil
        self.documentHTML = nil
        self.documentName = nil
        self.marginTop = nil
        self.marginBottom = nil
        self.marginLeft = nil
        self.marginRight = nil
        self.orientation = nil
        self.pageFormat = nil
        self.pageWidth = nil
        self.pageHeight = nil
        self.pageRanges = nil
        self.scale = nil
        self.headerText = nil
        self.headerAlign = nil
        self.headerMargin = nil
        self.headerHTML = nil
        self.headerURL = nil
        self.footerText = nil
        self.footerAlign = nil
        self.footerMargin = nil
        self.footerHTML = nil
        self.footerURL = nil
        self.printBackground = nil
        self.preferCSSPageSize = nil
        self.watermarkURL = nil
        self.watermarkPosition = nil
        self.watermarkOffsetX = nil
        self.watermarkOffsetY = nil
        self.title = nil
        self.author = nil
        self.creator = nil
        self.subject = nil
        self.keywords = [String]()
        self.language = nil
        self.encryption = nil
        self.ownerPassword = nil
        self.userPassword = nil
        self.permissions = nil
    }   

    public func toData() -> Data?
    {
        var dict: [String: Any] = [:]

        if documentURL != nil {
            dict["document_url"] = documentURL
        }

        if documentHTML != nil {
            dict["document_html"] = documentHTML
        }

        if documentName != nil {
            dict["document_name"] = documentName
        }

        if marginTop != nil {
            dict["margin_top"] = marginTop
        }
        
        if marginBottom != nil {
            dict["margin_bottom"] = marginBottom
        }
        
        if marginLeft != nil {
            dict["margin_left"] = marginLeft
        }
        
        if marginRight != nil {
            dict["margin_right"] = marginRight
        }
        
        if orientation != nil {
            dict["orientation"] = orientation
        }
        
        if pageFormat != nil {
            dict["page_format"] = pageFormat
        }
        
        if pageWidth != nil {
            dict["page_width"] = pageWidth
        }
        
        if pageHeight != nil {
            dict["page_height"] = pageHeight
        }
        
        if pageRanges != nil {
            dict["page_ranges"] = pageRanges
        }
        
        if scale != nil {
            dict["scale"] = scale
        }
        
        if headerText != nil {
            dict["header_text"] = headerText
        }
        
        if headerAlign != nil {
            dict["header_align"] = headerAlign
        }
        
        if headerMargin != nil {
            dict["header_margin"] = headerMargin
        }
        
        if headerHTML != nil {
            dict["header_html"] = headerHTML
        }
        
        if headerURL != nil {
            dict["header_url"] = headerURL
        }
        
        if footerText != nil {
            dict["footer_text"] = footerText
        }
        
        if footerAlign != nil {
            dict["footer_align"] = footerAlign
        }
        
        if footerMargin != nil {
            dict["footer_margin"] = footerMargin
        }
        
        if footerHTML != nil {
            dict["footer_html"] = footerHTML
        }
        
        if footerURL != nil {
            dict["footer_url"] = footerURL
        }
        
        if printBackground != nil {
            dict["print_background"] = printBackground
        }
        
        if preferCSSPageSize != nil {
            dict["prefer_css_page_size"] = preferCSSPageSize
        }
        
        if watermarkURL != nil {
            dict["watermark_url"] = watermarkURL
        }
        
        if watermarkPosition != nil {
            dict["watermark_position"] = watermarkPosition
        }
        
        if watermarkOffsetX != nil {
            dict["watermark_offset_x"] = watermarkOffsetX
        }
        
        if watermarkOffsetY != nil {
            dict["watermark_offset_y"] = watermarkOffsetY
        }
        
        if title != nil {
            dict["title"] = title
        }
        
        if author != nil {
            dict["author"] = author
        }
        
        if creator != nil {
            dict["creator"] = creator
        }
        
        if subject != nil {
            dict["subject"] = subject
        }
        
        if keywords.count > 0 {
            dict["keywords"] = keywords
        }

        if language != nil {
            dict["language"] = language
        }
        
        if encryption != nil {
            dict["encryption"] = encryption
        }
        
        if ownerPassword != nil {
            dict["owner_password"] = ownerPassword
        }
        
        if userPassword != nil {
            dict["user_password"] = userPassword
        }
        
        if permissions != nil {
            dict["permissions"] = permissions
        }

        return try? JSONSerialization.data(withJSONObject: dict)
    }
}