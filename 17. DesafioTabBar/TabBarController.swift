//
//  TabBarController.swift
//  17. DesafioTabBar
//
//  Created by Eduardo Escaleira on 03/03/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configItems()
        configTabBar()
        
    }
    

    func configItems() {
        guard let items = tabBar.items else { return }
        items[0].title = "Tela 01"
        items[0].image = UIImage(systemName: "person")
        items[1].title = "Tela 02"
        items[1].image = UIImage(systemName: "phone")
        items[2].title = "Tela 03"
        items[2].image = UIImage(systemName: "trash")
    }
    
    func configTabBar() {
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.layer.borderWidth = 0.2
        tabBar.backgroundColor = .white
    }

}
