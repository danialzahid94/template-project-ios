//
//  DZTextView.swift
//  FireTester
//
//  Created by Danial Zahid on 29/07/2015.
//  Copyright (c) 2015 Danial Zahid. All rights reserved.
//

import UIKit

class DZTextView: UITextView, UITextViewDelegate {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
    }
    
    @IBInspectable var cornerRadius: CGFloat = 5 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor(white: 0.75, alpha: 1.0) {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var placeholderText: String = "Description" {
        didSet {
            self.textColor = UIColor(white: 0.70, alpha: 1.0)
            self.text = placeholderText
        }
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if self.text == placeholderText {
            self.text = ""
            self.textColor = UIColor.blackColor()
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if self.text == "" {
            self.text = placeholderText
            self.textColor = UIColor(white: 0.70, alpha: 1.0)
        }
    }

}
