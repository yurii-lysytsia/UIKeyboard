//
//  UIKeyboardInfo.swift
//  UIKeyboard
//
//  Created by Yuri Fox on 1/31/19.
//  Copyright © 2019 Developer Lysytsia. All rights reserved.
//

import UIKit

extension UIKeyboard {
    
    public struct Info: Equatable {
        
        /// Rect that identifies the ending frame rectangle of the keyboard in screen coordinates. The frame rectangle reflects the current orientation of the device.
        public let frame: CGRect
        
        /// Time interval that identifies the duration of the animation in seconds.
        public let animationDuration: TimeInterval
        
        /// Animation curve constant that defines how the keyboard will be animated onto or off the screen.
        public let animationCurve: UIView.AnimationCurve
        
        /// Animation options constant that defines how the keyboard will be animated onto or off the screen.
        public var animationOptions: UIView.AnimationOptions {
            switch animationCurve {
            case .easeIn: return .curveEaseIn
            case .easeOut: return .curveEaseOut
            case .easeInOut: return UIView.AnimationOptions()
            default: return .curveLinear
            }
        }
        
        public init(userInfo: [AnyHashable : Any]) {
            let frame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect) ?? .zero
            let duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval) ?? 0
            let curve = UIView.AnimationCurve(rawValue: (userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int) ?? 0) ?? .linear
            
            self.frame = frame
            self.animationDuration = duration
            self.animationCurve = curve
        }
        
        public init?(notification: Notification) {
            guard let userInfo = notification.userInfo else { return nil }
            self.init(userInfo: userInfo)
        }
        
    }
    
}
