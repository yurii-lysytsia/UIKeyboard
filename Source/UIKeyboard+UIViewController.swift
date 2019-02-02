//
//  UIKeyboard+UIViewController.swift
//  UIKeyboard
//
//  Created by Yuri Fox on 2/2/19.
//  Copyright © 2019 Developer Lysytsia. All rights reserved.
//

import UIKit

fileprivate var keyboardKey = "UIViewControllerKeyboardKey"

extension UIViewController {
    
    /// Default UIViewController keyboard property. Use for notify about keyboard appearence changes
    public var keyboard: UIKeyboard {
        if let k = objc_getAssociatedObject(self, &keyboardKey) as? UIKeyboard {
            return k
        }
        
        let keyboard = UIKeyboard()
        objc_setAssociatedObject(self, &keyboardKey, keyboard, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        return keyboard
        
    }
    
}
