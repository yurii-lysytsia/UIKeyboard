//
//  UIKeyboard.swift
//  UIKeyboard
//
//  Created by Yuri Fox on 1/31/19.
//  Copyright © 2019 Developer Lysytsia. All rights reserved.
//

import UIKit

public class UIKeyboard {
    
    /// Keyboard delegates which notify about keyboard appearence changes
    public weak var delegate: UIKeyboardDelegate?
    
    private var willShowHandler: Handler?
    private var didShowHandler: Handler?
    private var willHideHandler: Handler?
    private var didHideHandler: Handler?
    
    public init() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { [weak self] (notification) in
            
            guard let info = UIKeyboard.Info(notification: notification) else {
                return
            }
            
            self?.willShowHandler?(info)
            self?.delegate?.keyboardWillShow(with: info)
            
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: nil) { [weak self] (notification) in
            
            guard let info = UIKeyboard.Info(notification: notification) else {
                return
            }
            
            self?.didShowHandler?(info)
            self?.delegate?.keyboardDidShow(with: info)
            
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { [weak self] (notification) in
            
            guard let info = UIKeyboard.Info(notification: notification) else {
                return
            }
            
            self?.willHideHandler?(info)
            self?.delegate?.keyboardWillHide(with: info)
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification, object: nil, queue: nil) { [weak self] (notification) in
            
            guard let info = UIKeyboard.Info(notification: notification) else {
                return
            }
            
            self?.didHideHandler?(info)
            self?.delegate?.keyboardDidHide(with: info)
        }
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    /// Posted immediately prior to the display of the keyboard
    ///
    /// - Parameter info: The information about the keyboard.
    @discardableResult
    public func willShow(handler: @escaping Handler) -> UIKeyboard {
        self.willShowHandler = handler
        return self
    }
    
    /// Posted immediately after the display of the keyboard.
    ///
    /// - Parameter info: The information about the keyboard.
    @discardableResult
    public func didShow(handler: @escaping Handler) -> UIKeyboard {
        self.didShowHandler = handler
        return self
    }
    
    /// osted immediately prior to the dismissal of the keyboard.
    ///
    /// - Parameter info: The information about the keyboard.
    @discardableResult
    public func willHide(handler: @escaping Handler) -> UIKeyboard {
        self.willHideHandler = handler
        return self
    }
    
    /// Posted immediately after the dismissal of the keyboard.
    ///
    /// - Parameter info: The information about the keyboard.
    @discardableResult
    public func didHide(handler: @escaping Handler) -> UIKeyboard {
        self.didHideHandler = handler
        return self
    }
    
    /// Closure with information about the keyboard.
    public typealias Handler = (UIKeyboard.Info) -> Void
    
}
