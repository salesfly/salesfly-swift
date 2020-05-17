import XCTest

@testable import Salesfly
import Foundation

class SalesflyTests: XCTestCase {
    override func setUp() {
        super.setUp()
        if let apiKey = ProcessInfo.processInfo.environment["SALESFLY_APIKEY"] {
            do {
                try SalesflyClient.initialize(apiKey: apiKey) 
            } catch {
                print(error)
                XCTAssert(false)      
            }
        }
    }

    override func tearDown() {
        // put code here..
        super.tearDown()
    }

    func testGetVersion() {
        let v = SalesflyClient.getVersion()
        XCTAssertEqual(v, Constants.VERSION)   
    }

    func testGetUsage() {
        do {
            let usage = try Usage.get()
            XCTAssertNotNil(usage!)
            print("Allowed:", usage!.allowed)
            print("Used:", usage!.used)
        } catch let err as SalesflyError {
            print("Request failed:", err) 
            XCTAssert(false)      
        } catch {
            print(error)
            XCTAssert(false)      
        }
    }

    func testCreatePDF() {
        do {
            var options = PDFOptions()
            options.documentURL = "https://example.com"
            let buffer = try PDF.create(options: options)
            try buffer!.write(to: URL(string: "file:///tmp/test-swift.pdf")!, options: .atomic)
            XCTAssertNotNil(buffer!)
        } catch let err as SalesflyError {
            print("Request failed:", err) 
            XCTAssert(false)      
        } catch {
            print(error)
            XCTAssert(false)      
        }
    }


/*    func testGetLocation() {
        do {
            let location = try GeoLocation.get(ip: "8.8.8.8")

            XCTAssertNotNil(location!)
            XCTAssertEqual(location!.countryCode!, "US")   
            print("Country:", location!.country!)
            print("Country code:", location!.countryCode!)
            dump(location!)
        } catch {
            print(error)
            XCTAssert(false)      
        }
    }

    func testGetLocationWithInvalidIP() {
        do {
            let location = try GeoLocation.get(ip: "288.8.8.8")
            XCTAssertNil(location!)   
         } catch let err as SalesflyError {
             switch err {
                 case .badRequest(let params):
                    XCTAssertEqual(params.code, "err-invalid-ip")      
                default:
                    print(err)
                    XCTAssert(false)      
             }
        } catch {
            print(error)
            XCTAssert(false)      
        }
    }

    func testGetBulkLocation() {
        do {
            let locations = try GeoLocation.getBulk(ipList: ["8.8.8.8", "apple.com"])
            XCTAssertEqual(locations!.count, 2)   
            dump(locations!)
        } catch {
            print("Unexpected error: \(error).")
            XCTAssert(false)      
        }
    }

    func testSendMail() {
        do {
            var message = MailMessage(from: "ok@demo2.org", to: ["ok@demo2.org"], subject: "Swift test", text: "This is just a test")
            message.attachments = ["/Users/otto/me.png"]
            let receipt = try Mail.send(message: message)
            XCTAssertNotNil(receipt!)
            print("Accepted recipients:", receipt!.acceptedRecipients)
        } catch let err as SalesflyError {
            print("Request failed:", err) 
            XCTAssert(false)      
        } catch {
            print(error)
            XCTAssert(false)      
        }
    }

    func testSendMailHTML() {
        do {
            var message = MailMessage(from: "ok@demo2.org", to: ["ok@demo2.org"], subject: "Swift test", text: "This is just a test")
            message.html = "<p>This is the test</p>"
            let receipt = try Mail.send(message: message)
            XCTAssertNotNil(receipt!)
            print("Accepted recipients:", receipt!.acceptedRecipients)
        } catch let err as SalesflyError {
            print("Request failed:", err) 
            XCTAssert(false)      
        } catch {
            print(error)
            XCTAssert(false)      
        }
    } */
}