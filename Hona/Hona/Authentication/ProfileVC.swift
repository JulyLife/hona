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
    
    @IBOutlet weak var testLabel: UILabel!
    
    @IBOutlet weak var profileImage: CircularImageView!
    @IBOutlet weak var bgGifImage: UIImageView!
    
    @IBOutlet weak var btnBG: RoundButton!
    
    @IBOutlet weak var btnSong: RoundButton!
    
    @IBOutlet weak var emojiButton: RoundButton!
    
    @IBOutlet weak var emj: UILabel!
    
    @IBOutlet weak var emj2: UILabel!
    
    @IBOutlet weak var emj3: UILabel!
    
    @IBOutlet weak var emj4: UILabel!
    
    @IBOutlet weak var emj5: UILabel!
    
    @IBOutlet weak var emj6: UILabel!
    
    @IBOutlet weak var emj7: UILabel!
    
    
    private var sideMenu: SideMenuNavigationController?
    var settingsController = UIViewController()
    var infoController = UIViewController()
    var othersController = UIViewController()
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
        testLabel.text = "@\(user?.username ?? "defaultUser")"
        profileImage.image = UIImage(named: user?.profile_pic.name ?? "img0")
        bgGifImage.loadGif(name: user?.profile_background.name ?? "thumbsup")
//        btnBG.layer.borderColor = UIColor(
//            named: user?.profile_background.colorName ?? "white") as! CGColor
        
        addChildController()
    }
        
    //    =======================
    
    
    
    @IBAction func bgClicked(_ sender: UIButton) {
        let number = Int.random(in: 0...5)
        if let index = users.firstIndex(where: { $0.username == user?.username }) {
            users[index].profile_background.name = bgs[number].name
            
            bgGifImage.loadGif(name: bgs[number].name )
            
        }
    }
    
    @IBAction func emojiClicked(_ sender: UIButton) {
        let emjs = ["😭","🤗","🥰","😔","🥶","❤️"]
        let number = Int.random(in: 0...5)
        emj.text = emjs[number]
        emj2.text = emjs[number]
        emj3.text = emjs[number]
        emj4.text = emjs[number]
        emj5.text = emjs[number]
        emj6.text = emjs[number]
        emj7.text = emjs[number]
        self.emj.fade()
         self.emj2.fade()
         self.emj3.fade()
         self.emj4.fade()
         self.emj5.fade()
         self.emj6.fade()
         self.emj7.fade()
    }
    
    @IBAction func songClicked(_ sender: UIButton) {
        emj.layer.removeAllAnimations()
        emj2.layer.removeAllAnimations()
        emj2.layer.removeAllAnimations()
        emj3.layer.removeAllAnimations()
        emj4.layer.removeAllAnimations()
        emj5.layer.removeAllAnimations()
        emj6.layer.removeAllAnimations()
        emj7.layer.removeAllAnimations()
    }
    private func addChildController() {
        settingsController = storyboard?.instantiateViewController(identifier: "settings") as! SettingsViewController
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

extension UIView {

func fade() {
      UIView.animate(withDuration: 3, delay: 0,options: [.curveEaseInOut ,.repeat, .autoreverse], animations: {
                self.frame.origin.y = 60
                self.alpha = 0.0
            }, completion: { _ in
                self.alpha = 0.0
            })
}
    

}
