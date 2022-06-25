//
//  NYTEndPoints.swift
//  NYTimesAssignment
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum NYTEndPoints {
    case getArticles(section: String, period: Int)

}

extension NYTEndPoints: EndPointType {

    var environmentBaseURL: String {
        switch APIManager.environment {
        case .production: return "http://api.nytimes.com/svc/mostpopular"
        case .qa: return "http://api.nytimes.com/svc/mostpopular"
        case .staging: return "http://api.nytimes.com/svc/mostpopular"
        }
    }

    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }

    var version: String {
        return "/v2"
    }

    var path: String {
        switch self {
        case .getArticles(let section, let period):
            return "mostviewed/\(section)/\(period).json"
        }

    }

    var httpMethod: HTTPMethod {
        switch self {
        case .getArticles:
            return .get
        }
    }

    var task: HTTPTask {
        switch self {
        case .getArticles:
            return .requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: ["api-key": APIManager.NYTimeAPIKey])
        }

    }

    var headers: HTTPHeaders? {
        switch self {
        default:
            return nil
        }
    }
}
