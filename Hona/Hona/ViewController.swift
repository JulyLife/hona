//
//  ViewController.swift
//  Hona
//
//  Created by ghanima on 10/16/20.
//  Copyright © 2020 ghanima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bgImage: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bgImage.loadGif(name: "summer")
    }


}

