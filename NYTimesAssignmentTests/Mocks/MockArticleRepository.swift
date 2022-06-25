//
//  MockArticleRepository.swift
//  NYTimesAssignmentTests
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import XCTest

@testable import NYTimesAssignment

class MockArticleRepository: XCTestCase {

    var shouldReturnError = false
    var fetchArticlesWasCalled = false
    var stubArticles: Articles!

    enum MockError: Error {
        case mostViewArticles
    }

    func reset() {
        shouldReturnError = false
        fetchArticlesWasCalled = false
        stubArticles = nil
    }
    func loadJson(filename fileName: String) -> Articles? {
            guard let data = loadJSONFromBundle(withName: "Articles", extension: "json") else { return nil }
            if let articles = Articles.decodeJsonData(parcelable: Articles.self, data, isObject: true) as? Articles {
                return articles
            }
        return nil
    }
}

extension MockArticleRepository: MostViewedArticleRepositoryProtocol {
    func fetchMostViewedArticles(completion: @escaping (Articles) -> Void, failure: @escaping (String?) -> Void) {
        fetchArticlesWasCalled = true
        if shouldReturnError {
            failure(MockError.mostViewArticles.localizedDescription)
        } else {
            if let articles = self.loadJson(filename: "Articles") {
                completion(articles)
            } else {
                failure(MockError.mostViewArticles.localizedDescription)
            }

        }
    }

}
