//
//  RootCoordinator.swift
//  Badminton_Management
//
//  Created by Stephen003 on 2023/9/27.
//

import UIKit

final class RootCoordinator: CoordinatorProtocol {
    private var navigation: UINavigationController
//    private var source: SourceFetchable = TimLiaoFetcher()

    required init(navigationController: UINavigationController) {
        self.navigation = navigationController
    }

    func start() {
        let vc = createSourcesViewController()
        navigation.setViewControllers([vc], animated: true)
    }
}

// MARK: - 頁面跳轉

extension RootCoordinator: SourcesViewControllerDelegate {
    private func createSourcesViewController() -> SourcesViewController {
        let typeName = "\(SourcesViewController.self)"
        let storyboard = UIStoryboard(name: typeName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: typeName) as! SourcesViewController
        viewController.delegate = self
        return viewController
    }
    
    func sourcesViewController(_ controller: SourcesViewController) {
        // 跳到下一個頁面
        let vc = createPostsViewController()
        navigation.pushViewController(vc, animated: true)
    }
}

// MARK: 目前場次事件頁面

extension RootCoordinator {
    
    private func createPostsViewController() -> OngoingEventViewController {
        let typeName = "\(OngoingEventViewController.self)"
        let storyboard = UIStoryboard(name: typeName, bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: typeName) as! OngoingEventViewController
        return viewController
    }
}
