//
//  Media.swift
//  NYTimesAssignment
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Media
class Media: Codable {
    let type: String?
    let subtype: String?
    let caption: String?
    let copyright: String?
    let approvedForSyndication: Int?
    let mediaMetadata: [MediaMetadatum]?

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }

    func getTumbnailMedia() -> MediaMetadatum? {
        guard let mediaMetadata = mediaMetadata else { return nil }
        let media = mediaMetadata.filter { (mediMetaData) -> Bool in
            if mediMetaData.format == .mediumThreeByTwo440 {
                return true
            }
            return false
        }
        return media.first ?? nil
    }
}
