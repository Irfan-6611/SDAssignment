//
//  Facet.swift
//  NYTimesAssignment
//
//  Created by mac on 05/08/2019.
//  Copyright © 2022 Irfan. All rights reserved.
//

import Foundation

enum Facet: Codable {
    case string(String)
    case stringArray([String])
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let facetArray = try? container.decode([String].self) {
            self = .stringArray(facetArray)
            return
        }
        if let facetString = try? container.decode(String.self) {
            self = .string(facetString)
            return
        }
        throw DecodingError.typeMismatch(Facet.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Facet"))
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let facetString):
            try container.encode(facetString)
        case .stringArray(let facetArray):
            try container.encode(facetArray)
        }
    }
}
