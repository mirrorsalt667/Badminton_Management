//
//  OngoingEventViewModel.swift
//  Badminton_Management
//
//  Created by Stephen003 on 2023/9/27.
//

import UIKit
import CoreData

protocol OngoingEventViewModelDelegate: AnyObject {
    func viewModel(_ viewModel: OngoingEventViewModel, didSelect index: Int, for data: [URL])
}

final class OngoingEventViewModel {
    
}
