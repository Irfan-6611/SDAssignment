//
//  Articles.swift
//  NYTimesAssignment
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import Foundation

// MARK: - Articles
class Articles: Codable, JSONDecoderable {
    let status, copyright: String?
    let numResults: Int?
    let results: [Result]?
}
