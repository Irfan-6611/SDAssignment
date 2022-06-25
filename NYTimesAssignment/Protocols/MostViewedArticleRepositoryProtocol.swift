//
//  File.swift
//  NYTimesAssignment
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import Foundation

protocol MostViewedArticleRepositoryProtocol {
    func fetchMostViewedArticles( completion :@escaping (Articles) -> Void, failure:@escaping (String?) -> Void)
}
