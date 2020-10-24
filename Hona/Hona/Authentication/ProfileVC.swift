//
//  ProfileVC.swift
//  Hona
//
//  Created by ghanima on 10/18/20.
//  Copyright © 2020 ghanima. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var testLabel: UILabel!
    var user: User?
    override func viewDidLoad() {
        super.viewDidLoad()
self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
        testLabel.text = user?.username
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
