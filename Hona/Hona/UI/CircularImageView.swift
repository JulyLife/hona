//
//  CircularImageView.swift
//  Hona
//
//  Created by ghanima on 10/25/20.
//  Copyright © 2020 ghanima. All rights reserved.
//

import UIKit
@IBDesignable
class CircularImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
//        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}
