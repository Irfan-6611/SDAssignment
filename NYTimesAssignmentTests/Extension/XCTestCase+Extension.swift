//
//  XCTestCase+Extension.swift
//  NYTimesAssignmentTests
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import XCTest

extension XCTestCase {
    // MARK: - Helper Methods
    func loadJSONFromBundle(withName name: String, extension: String) -> Data? {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: `extension`)
        do {
            let data = try Data(contentsOf: url!)
            return data
        } catch {
            print(error)
        }
        return nil
    }
}
