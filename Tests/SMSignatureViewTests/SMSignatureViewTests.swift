import XCTest
@testable import SMSignatureView
import SwiftUI
import PencilKit
@available(iOS 13.0, *)
final class SMSignatureViewTests: XCTestCase {
    
    @State var drawings: [PKDrawing] = [PKDrawing()]
    private let signatureBackgroundColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1.0)
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
       // XCTAssertEqual(SMSignatureView(drawings: $drawings, backgroundColor: signatureBackgroundColor), <#SMSignatureView#>)
    }
}
