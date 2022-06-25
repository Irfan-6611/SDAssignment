//
//  MediaMetadatum.swift
//  NYTimesAssignment
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import Foundation
import UIKit

// MARK: - MediaMetadatum
class MediaMetadatum: Codable {
    let url: String?
    let format: Format
    let height, width: Int?
}
