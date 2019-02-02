//
//  UIKeyboardDelegate.swift
//  UIKeyboard
//
//  Created by Yuri Fox on 2/2/19.
//  Copyright © 2019 Developer Lysytsia. All rights reserved.
//

import Foundation

public protocol UIKeyboardDelegate: class {
    
    /// Posted immediately prior to the display of the keyboard
    ///
    /// - Parameter info: The information about the keyboard.
    func keyboardWillShow(with info: UIKeyboard.Info)
    
    /// Posted immediately after the display of the keyboard.
    ///
    /// - Parameter info: The information about the keyboard.
    func keyboardDidShow(with info: UIKeyboard.Info)
    
    /// Posted immediately prior to the dismissal of the keyboard.
    ///
    /// - Parameter info: The information about the keyboard.
    func keyboardWillHide(with info: UIKeyboard.Info)
    
    /// Posted immediately after the dismissal of the keyboard.
    ///
    /// - Parameter info: The information about the keyboard.
    func keyboardDidHide(with info: UIKeyboard.Info)
    
}

extension UIKeyboardDelegate {
    func keyboardWillShow(with info: UIKeyboard.Info) { }
    func keyboardDidShow(with info: UIKeyboard.Info) { }
    func keyboardWillHide(with info: UIKeyboard.Info) { }
    func keyboardDidHide(with info: UIKeyboard.Info) { }
}
