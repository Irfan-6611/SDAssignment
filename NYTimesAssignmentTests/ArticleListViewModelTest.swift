//
//  ArticleListViewModelTest.swift
//  NYTimesAssignmentTests
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import XCTest
@testable import NYTimesAssignment

class ArticleListViewModelTest: XCTestCase {

    var stubArticles: Articles!
    var stubRepository: StubArticlesRepository!
    var sutArticleListViewModel: ArticleListViewModel!
    override func setUp() {

        super.setUp()
        sutArticleListViewModel = ArticleListViewModel()
        stubRepository  = StubArticlesRepository(dataManager: APIManager.shared)

        loadStubArticles()
        sutArticleListViewModel.repository = stubRepository
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func loadStubArticles() {
        guard let data = loadJSONFromBundle(withName: "Articles", extension: "json") else { return }
        if let articles = Articles.decodeJsonData(parcelable: Articles.self, data, isObject: true) as? Articles {
            stubArticles = articles
            stubRepository.dataToReturntoSuccess = stubArticles
        }
    }
    override func tearDown() {
        stubRepository = nil
        sutArticleListViewModel = nil
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchPoiListCalled() {
        sutArticleListViewModel.getMostViewedArticles()
        XCTAssert(stubRepository.isFetchArticlesCalled)
    }

    func testFetchPoiListSucess() {
        let expect = XCTestExpectation(description: "wait for reload Closure")
        var list: Array = [ArticleViewModel]()
        sutArticleListViewModel.reloadTableViewClosure = { (articles) in
            list = articles
            expect.fulfill()
        }
        sutArticleListViewModel.getMostViewedArticles()
        stubRepository.fetchSuccess()

        XCTAssert(list.count > 0 )
        wait(for: [expect], timeout: 1.0)

    }

    func testFetchPoiListFail() {
        stubRepository.shouldFailOnFetch = true
        let expect = XCTestExpectation(description: "wait for error Closure")
        var errorMSG = ""
        sutArticleListViewModel.showAlertClosure = { (error) in
            errorMSG = error
            expect.fulfill()
        }
        sutArticleListViewModel.getMostViewedArticles()
        stubRepository.fetchFail(error: NetworkError.noNetwork)
        XCTAssertNotEqual(errorMSG, "")
        wait(for: [expect], timeout: 1.0)

    }

}
