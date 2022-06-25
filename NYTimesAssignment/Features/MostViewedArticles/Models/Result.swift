//
//  Result.swift
//  NYTimesAssignment
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import Foundation

// MARK: - Result
//class Result: Codable {
//    let abstractField: String?
//    let adxKeyword: String?
//    let assetId: Int?
//    let byline: String?
//    let column: String?
//    let desFacet: Facet?
//    let geoFacet: Facet?
//    let id: Int?
//    let media: [Media]?
//    let orgFacet: Facet?
//    let perFacet: Facet?
//    let publishedDate: String?
//    let section: String?
//    let source: String?
//    let title: String?
//    let type: String?
//    let url: String?
//    let views: Int?
//
//
//}

struct Result: Codable {
    let abstract: String?
    let adxKeywords: String?
    let assetId: Int?
    let byline: String?
    let column: String?
    let desFacet: Facet?
    let geoFacet: Facet?
    let id: Int?
    let media: [Media]?
    let orgFacet: Facet?
    let perFacet: Facet?
    let publishedDate: String?
    let section: String?
    let subsection: String?
    let source: String?
    let title: String?
    let type: String?
    let url: String?
    let views: Int?
    enum CodingKeys: String, CodingKey {
        case abstract = "abstract"
        case adxKeywords = "adx_keywords"
        case assetId = "asset_id"
        case byline = "byline"
        case column = "column"
        case desFacet = "des_facet"
        case geoFacet = "geo_facet"
        case id = "id"
        case media = "media"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case publishedDate = "published_date"
        case section = "section"
        case source = "source"
        case subsection = "subsection"
        case title = "title"
        case type = "type"
        case url = "url"
        case views = "views"
    }
}
