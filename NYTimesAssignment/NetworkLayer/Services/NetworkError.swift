//
//  NetworkError.swift
//  NYTimesAssignment
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case noNetwork
    case serverError(String)
    case parsingError(String)
    case unknown(String)
    case other(String)
    case encodingFailed(String)
    case noData

}

extension NetworkError: LocalizedError {

    var localizedDescription: String {

        switch self {
        case .noNetwork:
            return "Please check your internet connection."
        case .serverError(let error):
            return error
        case .parsingError(let error):
            return error
        case .unknown(let error):
            return error
        case .other(let error):
            return error
        case .encodingFailed(let error):
            return error
        case .noData :
            return "Response returned with no data to decode."
        }
    }
}

struct Parsing {
    static let message = "Json Parsing Error"
    static let unKnown = "UnKnown Error occur, please try again"
    static let tokenError = "attempting to execute a request with an unauthorized token."
    static let noInternet = "Could not stablish connection to the Internet"
    static let operationCanceled = "this operation has been cancelled."
    static let operationTimeOut = "Operation timmed out."
}
