//
//  FacetEnumTest.swift
//  NYTimesAssignmentTests
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import XCTest
@testable import NYTimesAssignment

class NYTimesFacetEnumTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNYTimesFacetEnum() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNoThrow(Facet.string("StringToTest"), "Passed Facet String Type")
        XCTAssertNotNil(Facet.stringArray(["StringToTest1", "StringToTest2"]))
    }

}
