//
//  RootViewController.swift
//  FaceSpace22
//
//  Created by Jonavon Smith on 6/1/20.
//  Copyright © 2020 FaceSpaceInc. All rights reserved.
//

import UIKit
import SideMenu

class RootNavController: UINavigationController {

    var menu: UISideMenuNavigationController?
    let barButton = UIBarButtonItem()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menu = UISideMenuNavigationController(rootViewController: MenuListController())
            menu?.leftSide = true
        
        
        SideMenuManager.default.menuLeftNavigationController = menu
        
            }
    
    @IBAction func didTapMenu() {
    present(menu!, animated: true)

}
    
}


class MenuListController: UITableViewController {
    
    var items = ["First","Second", "Third", "First","Second", "Third", "First","Second", "Third"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
}
