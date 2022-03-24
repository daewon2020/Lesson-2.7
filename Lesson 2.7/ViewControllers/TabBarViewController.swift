//
//  TabBarViewController.swift
//  Lesson 2.7
//
//  Created by Kostya on 23.03.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
        
    private var personList: [Person]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personList = Person.getRandomPersonList()
        guard let viewControllers = self.viewControllers else { return }
        for viewController in viewControllers {
            if let navigationController = viewController as? UINavigationController {
                if let littleInfoVC = navigationController.topViewController
                    as? LittleInfoPersonListTableViewController {
                    littleInfoVC.personList = personList
                }else if let fullInfoVC = navigationController.topViewController
                    as? FullInfoPersonTableViewController {
                    fullInfoVC.personList = personList
                }
            }
        }
    }

}
