//
//  UIAutomatable.swift
//  TestHelper
//
//  Created by Craig Fisher on 7/25/22.
//

import UIKit

/// Protocol to be consumed by base view controller if/when possible for the broadest reach.
protocol UIAutomatable {
    func setAccessibilityIdentifiers()
}

extension UIAutomatable {
    
    /// Simply call setAccessibilityIdentifiers() from viewDidLoad.
    /// This will automatically set the accessibilityIdentifiers that are children of the view.
    /// Example output: "myButton.MyViewController"
    func setAccessibilityIdentifiers() {
        let mirror = Mirror(reflecting: self)

        for child in mirror.children {
            switch child.value {
            case is UIView:
                let aView = child.value as! UIView
                let myClassType = type(of: self)
                aView.accessibilityIdentifier = "\(child.label ?? "Label not found.").\(myClassType)"
                debugPrint("\(child.label ?? "").\(myClassType)")
            default:
            break
            }
        }
    }
}
