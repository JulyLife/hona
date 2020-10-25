//
//  ViewController.swift
//  Hona
//
//  Created by ghanima on 10/16/20.
//  Copyright © 2020 ghanima. All rights reserved.
//
import SideMenu
import UIKit

class ViewController: UIViewController {
// private let sidemenu = SideMenuNavigationController(rootViewController: UIViewController())
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var passTextfield: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bgImage.loadGif(name: "summer")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action:nil)
    }
    

    @IBAction func loginButton(_ sender: Any) {
        let username = nameTextfield.text
        let password = passTextfield.text
        if(username == "" || password == ""){
            errorLabel.text = "Please fill the form"
            return
        }
        DoLogin(username!, password!)
    }
    func DoLogin(_ user:String,_ pass:String){
        let user_ = users.filter{$0.username == user && $0.password == pass}
        if(user_.isEmpty){
            errorLabel.text = "username or password is invalid, pleasse try again"
            return
        }else{
            errorLabel.text = ""
           
//            self.performSegue(withIdentifier: "profile", sender: user)
            let viewController = storyboard?.instantiateViewController(identifier: "profile") as! ProfileVC
            viewController.user = user_[0]
            self.navigationController?.pushViewController(viewController, animated: true)
//
        }
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//       let user = sender as! User
//                let vc =   segue.destination as! ProfileVC
//        vc.testLabel.text = user.username
//                }
    
    

   
        
    
        }

    
    


extension String {
    
    func isValidName() -> Bool {
        let inputRegEx = "^[a-zA-Z\\_]{2.25}$"
        let inputPred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputPred.evaluate(with: self)
    }
     func isValidPassword() -> Bool {
           let inputRegEx = "^[a-zA-Z\\_]{2.25}$"
           let inputPred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputPred.evaluate(with: self)
    }
}

  
