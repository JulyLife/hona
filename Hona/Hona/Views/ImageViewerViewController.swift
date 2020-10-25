//
//  ImageViewerViewController.swift
//  Hona
//
//  Created by ghanima on 10/25/20.
//  Copyright © 2020 ghanima. All rights reserved.
//

import UIKit

class ImageViewerViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    var imageName: String!
    override func viewDidLoad() {
        super.viewDidLoad()
setupImage()
        // Do any additional setup after loading the view.
    }
    private func setupImage(){
        guard let name = imageName else {return}
        
        if let image = UIImage(named: name){
            imageView.image  = image
        }
        
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
