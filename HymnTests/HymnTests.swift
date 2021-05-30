//
//  HymnTests.swift
//  HymnTests
//
//  Created by Andrew Ananda on 02/05/2021.
//

import XCTest
@testable import Hymn

class HymnTests: XCTestCase {

    var hymnViewController: HymnViewController!
    var hymnViewModel: HymnViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        hymnViewController = HymnViewController()
        hymnViewModel = HymnViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        hymnViewController = nil
        hymnViewModel = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSpecialCharacter() {
        let string = "<p>Andrew Ananda</p>"
        let expected = "Andrew Ananda"
        let value = hymnViewModel.filterString(string: string)
        XCTAssertEqual(value, expected, "The value should return without special character \(value)")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
