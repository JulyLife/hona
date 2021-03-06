//
//  DesignView.swift
//  Hona
//
//  Created by ghanima on 10/17/20.
//  Copyright © 2020 ghanima. All rights reserved.
//

import UIKit

@IBDesignable
class DesignView: UIView{
     
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
    didSet {
                layer.shadowColor = shadowColor.cgColor
            }
        }
    @IBInspectable var shadowRadius: CGFloat = 0 {
    didSet {
                layer.shadowRadius = shadowRadius
            }
        }
    @IBInspectable var shadowOpacity: CGFloat = 0 {
    didSet {
                layer.shadowOpacity = Float(shadowOpacity)
            }
        }
    @IBInspectable var shadowOffsetY: CGFloat = 0 {
    didSet {
                layer.shadowOffset.height = shadowOffsetY
            }
        }
    }

