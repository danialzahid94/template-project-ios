//
//  extrasClass.swift
//  MyDocChat
//
//  Created by Vikas Baru on 29/05/15.
//  Copyright (c) 2015 VikasBaru. All rights reserved.
//

import UIKit


class UtilityManager: NSObject {
    
    //MARK: - Constant declarations
    
    static let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    static let PHONE_REGEX = "^\\d{10}$"
    
    static var msgWrongPassword = "Password & Confirm password are not match"
    static var msgInvalidEmail = "Invalid Email"
    static var msgInvalidMobile = "Invalid Mobile"
    static var msgFillAll = "Fill All Field"
    
    //MARK: - Validity Checks
    
    static func isValidEmail(testStr:String) -> Bool {
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if emailTest.evaluateWithObject(testStr) {
            return true
        }
        return false
    }
    
    static func isMobileValid(value: String) -> Bool {
        
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        
        if phoneTest.evaluateWithObject(value) {
            return true
        }
        return false
    }
    
    //MARK : - UIImage Methods
    
    static func convertBase64ToImage(base64String: String) -> UIImage {
        
        let decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions(rawValue: 0) )
        
        let decodedimage = UIImage(data: decodedData!)
        
        return decodedimage!
        
    }
    
    //MARK: - Date/String Methods
    
    /*static func stringToNSDate(strDate:NSString) -> String {
        let timeInterval:NSTimeInterval = strDate.doubleValue
        let date = NSDate(timeIntervalSince1970: timeInterval)
        let time = timeAgoSinceDate(date, numericDates: true)
        
        return time
    }*/
    
    static func stringFromNSDateWithFormat(date: NSDate, format : String) -> String {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.stringFromDate(date)
        
    }
    
    static func dateFromStringWithFormat(date: String, format: String) -> NSDate{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.dateFromString(date)!
    }
    
    static func timeStringTillDate(date : NSDate) -> String {
        let calendar = NSCalendar.currentCalendar()
        let unitFlags: NSCalendarUnit = [NSCalendarUnit.Minute, NSCalendarUnit.Hour, NSCalendarUnit.Day, NSCalendarUnit.WeekOfYear]
        
        let now = NSDate()
        let earliest = now.earlierDate(date)
        if earliest == date {
            return "Event Ended"
        }
        
        let latest = (earliest == now) ? date : now
        
        let components:NSDateComponents = calendar.components(unitFlags, fromDate: earliest, toDate: latest, options: [])
        
        if (components.weekOfYear >= 2) {
            return "Ending in \(components.weekOfYear) weeks"
        }
        else if (components.weekOfYear >= 1){
            return "Ending next week"
        }
            
        else if (components.day >= 2) {
            return "Ending in \(components.day) days"
        }
        else if (components.day >= 1){
            return "Ending tomorrow"
        }
            
        else if (components.hour >= 2) {
            return "Ending in \(components.hour) hours"
        }
        else if (components.hour >= 1){
            return "Ending in an hour"
        }
        else{
            return "Ending in few minutes"
        }
        
    }
    
    
    static func timeAgoSinceDate(date:NSDate, numericDates:Bool) -> String {
        
        
        let calendar = NSCalendar.currentCalendar()
        let unitFlags: NSCalendarUnit = [NSCalendarUnit.Minute, NSCalendarUnit.Hour, NSCalendarUnit.Day, NSCalendarUnit.WeekOfYear, NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.Second]
        
        
        let now = NSDate()
        let earliest = now.earlierDate(date)
        let latest = (earliest == now) ? date : now
        let components:NSDateComponents = calendar.components(unitFlags, fromDate: earliest, toDate: latest, options: [])
        
        if (components.year >= 2) {
            return "\(components.year) years ago"
        } else if (components.year >= 1){
            if (numericDates){
                return "1 year ago"
            } else {
                return "Last year"
            }
        } else if (components.month >= 2) {
            return "\(components.month) months ago"
        } else if (components.month >= 1){
            if (numericDates){
                return "1 month ago"
            } else {
                return "Last month"
            }
        } else if (components.weekOfYear >= 2) {
            return "\(components.weekOfYear) weeks ago"
        } else if (components.weekOfYear >= 1){
            if (numericDates){
                return "1 week ago"
            } else {
                return "Last week"
            }
        } else if (components.day >= 2) {
            return "\(components.day) days ago"
        } else if (components.day >= 1){
            if (numericDates){
                return "1 day ago"
            } else {
                return "Yesterday"
            }
        } else if (components.hour >= 2) {
            return "\(components.hour) hours ago"
        } else if (components.hour >= 1){
            if (numericDates){
                return "1 hour ago"
            } else {
                return "An hour ago"
            }
        } else if (components.minute >= 2) {
            return "\(components.minute) minutes ago"
        } else if (components.minute >= 1){
            if (numericDates){
                return "1 minute ago"
            } else {
                return "A minute ago"
            }
        } else if (components.second >= 3) {
            return "\(components.second) seconds ago"
        } else {
            return "Just now"
        }
        
    }
    
    //MARK: - UI Methods
    
    static func Shadow(sender: AnyObject, radious1 : CGFloat, color : CGColor) -> AnyObject {
        
        let element : AnyObject = sender as AnyObject
        
        element.layer.shadowColor = color
        element.layer.shadowOffset = CGSizeMake(2, 2)
        element.layer.shadowRadius = radious1
        element.layer.shadowOpacity = 0.7
        
        return element;
    }
    
    static func Glow(sender: AnyObject, radious1 : CGFloat, color : CGColor, opacity: Float) -> AnyObject {
        
        let element : AnyObject = sender as AnyObject
        
        element.layer.shadowColor = color
        element.layer.shadowOffset = CGSizeMake(5, 5)
        element.layer.shadowRadius = radious1
        element.layer.shadowOpacity = opacity
        
        return element;
    }
    
    static func Border(sender: AnyObject, borderwidth : CGFloat , radious1 : CGFloat, color : CGColor) -> AnyObject {
        
        let element : AnyObject = sender as AnyObject
        
        element.layer.cornerRadius = radious1
        element.layer.borderWidth = borderwidth
        element.layer.borderColor = color
        //UIColor(red: 235.0/255.0, green: 231.0/255.0, blue: 231.0/255.0, alpha: 1.0).CGColor
        return element;
    }
    
    static func bottomBorder(sender: AnyObject, padding: CGFloat) -> Void{
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 0.65).CGColor;
        border.frame = CGRect(x: padding, y: sender.frame.size.height - width, width:  sender.frame.size.width-padding, height: sender.frame.size.height)
        
        border.borderWidth = width
        sender.layer.addSublayer(border)
        sender.layer.masksToBounds = true
    }
    
    static func bottomBorder(sender: AnyObject) -> Void{
        bottomBorder(sender, padding: 0.0)
    }

    static func bottomBorderWhite(sender: AnyObject) -> Void{
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.whiteColor().CGColor
        border.frame = CGRect(x: 0, y: sender.frame.size.height - width, width:  sender.frame.size.width, height: sender.frame.size.height)
        
        border.borderWidth = width
        sender.layer.addSublayer(border)
        sender.layer.masksToBounds = true
    }

    static func topBorder(sender: AnyObject) -> Void{
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor(red: 172.0/255.0, green: 172.0/255.0, blue: 172.0/255.0, alpha: 0.7).CGColor;
        border.frame = CGRect(x: 0, y: 0, width:  sender.frame.size.width, height: 1)
        
        border.borderWidth = width
        sender.layer.addSublayer(border)
        sender.layer.masksToBounds = true
    }
    
    //MARK: GCD Methods
    
    static func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    //MARK: - Other Methods
    
    static func activityIndicatorForView(view: UIView) -> UIActivityIndicatorView{
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        activityIndicator.color = UIColor.darkGrayColor()
        activityIndicator.center = view.center
        
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }
    
    static func uniqueKeyWithLength (len : Int) -> NSString {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        let randomString : NSMutableString = NSMutableString(capacity: len)
        
        for (var i=0; i < len; i++){
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        
        return randomString
    }
    
    
    
}
