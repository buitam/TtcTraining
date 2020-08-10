//
//  UIViewControllerExtension.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/10/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
func createAnimated(self: UIViewController) {
    let transition: CATransition = CATransition()
    transition.duration = 0.5
    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    transition.type = CATransitionType.reveal
    transition.subtype = CATransitionSubtype.fromRight
    self.view.window!.layer.add(transition, forKey: nil)
}
