//
//  SignUpVC.swift
//  Hona
//
//  Created by ghanima on 10/17/20.
//  Copyright © 2020 ghanima. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var bgImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgImage.loadGif(name: "thumbsup")
//        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
