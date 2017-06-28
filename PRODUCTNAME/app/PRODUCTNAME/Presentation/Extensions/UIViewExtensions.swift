//
//  UIViewExtensions.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 20/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import UIKit

public extension UIView {
    var left: CGFloat {
        set { self.frame.origin.x = newValue }
        get { return self.frame.origin.x }
    }
    var right: CGFloat {
        set { self.frame.origin.x = newValue - self.frame.size.width }
        get { return self.frame.origin.x + self.frame.size.width }
    }
    var top: CGFloat {
        set { self.frame.origin.y = newValue }
        get { return self.frame.origin.y }
    }
    var bottom: CGFloat {
        set { self.frame.origin.y = newValue - self.frame.size.height }
        get { return self.frame.origin.y + self.frame.size.height }
    }
    var centerX: CGFloat {
        set { self.center = CGPoint(x: newValue, y: self.center.y) }
        get { return self.center.x }
    }
    var centerY: CGFloat {
        set { self.center = CGPoint(x: self.center.x, y: newValue) }
        get { return self.center.y }
    }

    var width: CGFloat {
        set { self.frame.size.width = newValue }
        get { return self.frame.size.width }
    }

    var height: CGFloat {
        set { self.frame.size.height = newValue }
        get { return self.frame.size.height }
    }

    var origin: CGPoint {
        set { self.frame.origin = newValue }
        get { return self.frame.origin }
    }

    var size: CGSize {
        set { self.frame.size = newValue }
        get { return self.frame.size }
    }

    func centerXInView(contentView: UIView) {
        self.centerX = contentView.width/2
    }
    func centerYInView(contentView: UIView) {
        self.centerY = contentView.height/2
    }
    func centerInView(contentView: UIView) {
        self.centerXInView(contentView: contentView)
        self.centerYInView(contentView: contentView)
    }

    func removeAllSubviews() {
        self.subviews.forEach({ $0.removeFromSuperview() })
    }

    /**
     Removes all constraints for this view
     */
    func removeAllConstraints() {
        if let superview = self.superview {
            var list = [NSLayoutConstraint]()
            for constraint in superview.constraints {
                if constraint.firstItem as? UIView == self || constraint.secondItem as? UIView == self {
                    list.append(constraint)
                }
            }
            superview.removeConstraints(list)
        }
        self.removeConstraints(self.constraints)
    }
}
