//
//  MostViewedArticlesAPIResponseTest.swift
//  NYTimesAssignmentTests
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

@testable import NYTimesAssignment
import XCTest

class MostViewedArticlesAPIResponseTest: XCTestCase {
    var mockArticleRepository: MockArticleRepository!

    override func setUp() {
        super.setUp()
        mockArticleRepository = MockArticleRepository()
        mockArticleRepository.reset()
    }

    override func tearDown() {
        mockArticleRepository = nil
    }

    func testMostViewedArticleAPIResponseSuccess() {

        weak var expectation = self.expectation(description: "Response Received")

        mockArticleRepository.fetchMostViewedArticles(completion: { (articles) in
            XCTAssertNotNil(articles)

            expectation?.fulfill()

        }, failure: { (errorMessage) in

            XCTFail(errorMessage ?? "Error: json not valid")

        })

        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error)
        }
    }

    func testMostViewedArticleAPIResponsefailure() {

        weak var expectation = self.expectation(description: "Response Received")
        mockArticleRepository.shouldReturnError = true
        mockArticleRepository.fetchMostViewedArticles(completion: { (articles) in
            XCTAssertNotNil(articles)

            expectation?.fulfill()

        }, failure: { (errorMessage) in

            XCTFail(errorMessage ?? "Error: json not valid")

        })

        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error)
        }
    }
}
