//
//  ArticlesRepository.swift
//  NYTimesAssignment
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import Foundation

class ArticlesRepository: MostViewedArticleRepositoryProtocol {

    // Dependency Injection
    private var dataManager: APIManager
    init(dataManager: APIManager) {
        self.dataManager = dataManager
    }

    func fetchMostViewedArticles( completion :@escaping (Articles) -> Void, failure:@escaping (String?) -> Void) {

        dataManager.fetchGenericData(endPoint: .getArticles(section: AppConstants.section, period: AppConstants.period)) { (articles: Articles?, error) in
            guard error == nil else {
                failure(error?.localizedDescription)
                return
            }

            if let articles = articles {
                completion(articles)
            } else {
                failure(error?.localizedDescription)
            }
        }

    }

}
