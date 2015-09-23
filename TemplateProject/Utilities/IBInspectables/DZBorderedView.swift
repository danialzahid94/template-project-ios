//
//  DZBorderedView.swift
//  FireTester
//
//  Created by Danial Zahid on 31/07/2015.
//  Copyright (c) 2015 Danial Zahid. All rights reserved.
//

import UIKit

class DZBorderedView: UIView {
    
    @IBInspectable var topBorderWidth: CGFloat = 0
    @IBInspectable var topBorderColor: UIColor = UIColor.clearColor()
    @IBInspectable var rightBorderWidth: CGFloat = 0
    @IBInspectable var rightBorderColor: UIColor = UIColor.clearColor()
    @IBInspectable var bottomBorderWidth: CGFloat = 0
    @IBInspectable var bottomBorderColor: UIColor = UIColor.clearColor()
    @IBInspectable var leftBorderWidth: CGFloat = 0
    @IBInspectable var leftBorderColor: UIColor = UIColor.clearColor()
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        if (topBorderWidth > 0){
            let border = CALayer()
            border.backgroundColor = topBorderColor.CGColor;
            border.frame = CGRect(x: 0, y: 0, width:  self.frame.size.width, height: topBorderWidth)
            border.opacity = 0.7
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
        if (rightBorderWidth > 0){
            let border = CALayer()
            border.backgroundColor = rightBorderColor.CGColor;
            border.frame = CGRect(x: self.frame.size.width - rightBorderWidth, y: 0, width:  rightBorderWidth, height: self.frame.size.height)
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
        if (bottomBorderWidth > 0){
            let border = CALayer()
            border.backgroundColor = bottomBorderColor.CGColor;
            border.frame = CGRect(x: 0, y: self.frame.size.height - bottomBorderWidth, width:  self.frame.size.width, height: bottomBorderWidth)
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
        if (leftBorderWidth > 0){
            let border = CALayer()
            border.backgroundColor = leftBorderColor.CGColor;
            border.frame = CGRect(x: 0, y: 0, width:  leftBorderWidth, height: self.frame.size.height)
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
        
    }
    
}
