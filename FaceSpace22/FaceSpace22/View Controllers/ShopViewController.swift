//
//  ShopViewController.swift
//  FaceSpace22
//
//  Created by Jonavon Smith on 5/27/20.
//  Copyright © 2020 FaceSpaceInc. All rights reserved.
//

import UIKit
import SideMenu

class ShopViewController: UIViewController {
    
    
    var menu: UISideMenuNavigationController? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
              swipeRight.direction = UISwipeGestureRecognizer.Direction.right
              self.view.addGestureRecognizer(swipeRight)

              let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
              swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
              self.view.addGestureRecognizer(swipeLeft)
        
        menu = UISideMenuNavigationController(rootViewController: MenuListController())
                   menu?.leftSide = true
              
               SideMenuManager.default.menuLeftNavigationController = menu
     
          }
    
    @IBAction func didTapMenu() {
        present(menu!, animated: true)

    }
              
         @objc func swiped(_ gesture: UISwipeGestureRecognizer) {
                  if gesture.direction == .left {
                      if (self.tabBarController?.selectedIndex)! < 4 { // set your total tabs here
                          self.tabBarController?.selectedIndex += 1
                      }
                  } else if gesture.direction == .right {
                      if (self.tabBarController?.selectedIndex)! > 0 {
                          self.tabBarController?.selectedIndex -= 1
                      }
                  }
              }

      }



