//
//  ProfileVC.swift
//  Hona
//
//  Created by ghanima on 10/18/20.
//  Copyright © 2020 ghanima. All rights reserved.
//
import SideMenu
import UIKit

class ProfileVC: UIViewController, MenuControllerDelegate {
    
    private var sideMenu: SideMenuNavigationController?
    
    var settingsController = SettingsViewController()
    var infoController = UIViewController()
    var othersController = UIViewController()
    @IBOutlet weak var testLabel: UILabel!
    var user: User?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menu =
            MenuController(with: SideMenuItem.allCases)
        
        menu.delegate = self
        
       sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
        testLabel.text = user?.username
        
        addChildController()
    }
        
    //    =======================
    private func addChildController() {
        othersController = storyboard?.instantiateViewController(identifier: "others") as! OtherUsersViewController
        infoController = storyboard?.instantiateViewController(identifier: "graph") as! InfoViewController
        addChild(settingsController)
        addChild(infoController)
        addChild(othersController)
        
        view.addSubview(settingsController.view)
          view.addSubview(infoController.view)
        view.addSubview(othersController.view)
        
        
        settingsController.view.frame = view.bounds
          infoController.view.frame = view.bounds
        othersController.view.frame = view.bounds
        
        settingsController.didMove(toParent: self)
        infoController.didMove(toParent: self)
        othersController.didMove(toParent: self)
        
        settingsController.view.isHidden = true
        infoController.view.isHidden = true
        othersController.view.isHidden = true
    }
    
    @IBAction func didTapMenuButton(){
          present(sideMenu!,animated: true)
      }
    
    func didSelectMenuItem(named: SideMenuItem) {
        sideMenu?.dismiss(animated: true, completion: nil)
           title = named.rawValue
           
           switch named {
           case .home:
            settingsController.view.isHidden = true
           infoController.view.isHidden = true
            othersController.view.isHidden = true
               
           case .settings:
           settingsController.view.isHidden = false
           infoController.view.isHidden = true
           othersController.view.isHidden = true
            
           case .others:
            settingsController.view.isHidden = true
            infoController.view.isHidden = true
            othersController.view.isHidden = false
            
            case .info:
            settingsController.view.isHidden = true
            infoController.view.isHidden = false
            othersController.view.isHidden = true
            
            
        }
    }
    
//    =======================
    
    
    
    
    
}

