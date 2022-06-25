//
//  StubArticlesRepository.swift
//  NYTimesAssignmentTests
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import Foundation
@testable import NYTimesAssignment

class StubArticlesRepository: ArticlesRepository {

    var dataToReturntoSuccess: Articles?
    var shouldFailOnFetch: Bool = false

    var isFetchArticlesCalled = false

    var completeClosure: ((Articles) -> Void)!
    var failureClosure: ((String?) -> Void)!

    override func fetchMostViewedArticles(completion complete: @escaping (Articles) -> Void, failure: @escaping (String?) -> Void) {
        isFetchArticlesCalled = true
        if shouldFailOnFetch {
            failureClosure = failure
        } else {
            completeClosure = complete
        }
    }

    func fetchSuccess() {
        if let data = dataToReturntoSuccess {
            completeClosure(data)
        } else {
            failureClosure(NetworkError.other("Dummy data not assigned").localizedDescription)

        }
    }

    func fetchFail(error: NetworkError) {
        failureClosure(error.localizedDescription)
    }

}
