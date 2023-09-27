//
//  CoordinatorProtocol.swift
//  Badminton_Management
//
//  Created by Stephen003 on 2023/9/27.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    init(navigationController: UINavigationController)
    func start()
}

