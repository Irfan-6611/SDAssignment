//
//  UIStoryboard+Extensions.swift
//  NYTimesAssignment
//
//  Created by Irfan on 25/06/2022.
//  Copyright © 2022 Irfan. All rights reserved.
//

import UIKit

extension UIStoryboard {
    enum SBNames: String {
        case Main

        var fileName: String {
            return rawValue
        }
    }

    convenience init(type: SBNames, bundle: Bundle? = nil) {
        self.init(name: type.fileName, bundle: bundle)
    }

    static func initialViewController(for type: SBNames) -> UIViewController {
        let storyboard = UIStoryboard(type: type)
        guard let initialViewController = storyboard.instantiateInitialViewController() else {
            fatalError("Couldn't instantiate initial view controller for \(type.fileName) storyboard.")
        }

        return initialViewController

    }

    static func instantiateViewController(for type: SBNames, indentifier: String) -> UIViewController {
        let storyboard = UIStoryboard(type: type)
        let instantiatedViewController = storyboard.instantiateViewController(withIdentifier: indentifier)
        return instantiatedViewController

    }

}
