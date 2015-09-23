//
//  ShadowView.swift
//  Pros and Cons
//
//  Created by Danial Zahid on 9/11/15.
//  Copyright © 2015 Danial Zahid. All rights reserved.
//

import UIKit

class ShadowButton: UIButton {

    //MARK: - IBInspectables
    
    @IBInspectable var shadowColor : UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    @IBInspectable var shadowOffset : CGSize = CGSizeMake(3, 3)
    @IBInspectable var shadowRadius : CGFloat = CGFloat(3.0)
    @IBInspectable var shadowOpacity : Float = 1
    
    //MARK: - View lifecycle
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        layer.shadowColor = shadowColor.CGColor
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        
    }


}
