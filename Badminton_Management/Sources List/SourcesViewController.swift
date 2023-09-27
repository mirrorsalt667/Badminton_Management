//
//  SourcesViewController.swift
//  Badminton_Management
//
//  Created by Stephen003 on 2023/9/27.
//

import UIKit

// MARK: 首頁

protocol SourcesViewControllerDelegate: AnyObject {
    func sourcesViewController(_ controller: SourcesViewController)
}

final class SourcesViewController: UIViewController {
    
    // MARK: Properties
    
    weak var delegate: SourcesViewControllerDelegate?

    // MARK: View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("首頁出現")
    }
}
