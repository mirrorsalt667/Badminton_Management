//
//  CustomNavigationViewController.swift
//  Badminton_Management
//
//  Created by Stephen003 on 2023/9/27.
//

import UIKit

class CustomNavigationViewController: UINavigationController {
    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}
