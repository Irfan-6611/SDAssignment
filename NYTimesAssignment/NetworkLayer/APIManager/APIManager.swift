//
//  APIManager.swift
//  NYTimesAssignment
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import Foundation

struct APIManager {
    static let environment: NetworkEnvironment = .production
    static let NYTimeAPIKey = AppConstants.NYTimesAPIKey
    static let shared = APIManager()
    private init() {}
    let router = Router<NYTEndPoints>()

    func fetchGenericData <T: Codable>(endPoint: NYTEndPoints, completion: @escaping (_ model: T?, _ error: NetworkError?) -> Void) {
        router.request(endPoint) { data, _, _ in

            guard let data = data else {
                completion(nil, NetworkError.noData)
                return
            }

            do {
                JSONDecoder().keyDecodingStrategy = .convertFromSnakeCase
                let articles = try JSONDecoder().decode(T.self, from: data)
                completion(articles, nil)

            } catch {
                completion(nil, NetworkError.parsingError(Parsing.message))
            }
        }
    }
}
