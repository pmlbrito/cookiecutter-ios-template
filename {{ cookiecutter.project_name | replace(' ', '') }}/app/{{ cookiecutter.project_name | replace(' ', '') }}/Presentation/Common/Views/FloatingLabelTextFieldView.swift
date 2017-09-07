//
//  FloatingLabelTextFieldView.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 06/09/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import UIKit

@IBDesignable public class FloatingLabelTextFieldView: UITextField {
    let animationDuration = 0.3
    var title = UILabel()

    let defaultPadding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

    // MARK: - Properties
    override public var accessibilityLabel: String! {
        get {
            if  text == nil || text?.characters.count == 0 {
                return title.text
            }
            else {
                return text
            }
        }
        set {
            self.accessibilityLabel = newValue
        }
    }

    override public var placeholder: String? {
        didSet {
            title.text = placeholder
            title.sizeToFit()
        }
    }

    override public var attributedPlaceholder: NSAttributedString? {
        didSet {
            title.text = attributedPlaceholder?.string
            title.sizeToFit()
        }
    }

    var titleFont: UIFont = UIFont.systemFont(ofSize: 11.0) {
        didSet {
            title.font = titleFont
            title.sizeToFit()
        }
    }

    @IBInspectable var hintYPadding: CGFloat = 0.0

    @IBInspectable var titleYPadding: CGFloat = 0.0 {
        didSet {
            var r = title.frame
            r.origin.y = titleYPadding
            title.frame = r
        }
    }

    @IBInspectable var titleTextColour: UIColor = UIColor.gray {
        didSet {
            if !isFirstResponder {
                title.textColor = titleTextColour
            }
        }
    }

    @IBInspectable var titleActiveTextColour: UIColor! {
        didSet {
            if isFirstResponder {
                title.textColor = titleActiveTextColour
            }
        }
    }

    // MARK: - Init
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    // MARK: - Overrides
    override public func layoutSubviews() {
        super.layoutSubviews()
        setTitlePositionForTextAlignment()
        let isResp = isFirstResponder
        if isResp && !( text == nil || text?.characters.count == 0) {
            title.textColor = titleActiveTextColour
        }
        else {
            title.textColor = titleTextColour
        }
        // Should we show or hide the title label?
        if  text == nil || text?.characters.count == 0 {
            // Hide
            hideTitle(animated: isResp)
        }
        else {
            // Show
            showTitle(animated: isResp)
        }
    }

    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        var r = super.textRect(forBounds: bounds)
        if !( text == nil || text?.characters.count == 0) {
            var top = ceil(title.font.lineHeight + hintYPadding)
            top = min(top, maxTopInset())
            r = UIEdgeInsetsInsetRect(r, UIEdgeInsets(top: top, left: 0.0, bottom: 0.0, right: 0.0))
        }
        //    return CGRectIntegral(r)
        return UIEdgeInsetsInsetRect(r, defaultPadding)
    }

    override public func editingRect(forBounds: CGRect) -> CGRect {
        var r = super.editingRect(forBounds: bounds)
        if !( text == nil || text?.characters.count == 0) {
            var top = ceil(title.font.lineHeight + hintYPadding)
            top = min(top, maxTopInset())
            r = UIEdgeInsetsInsetRect(r, UIEdgeInsets(top: top, left: 0.0, bottom: 0.0, right: 0.0))
        }
        //    return CGRectIntegral(r)
        return UIEdgeInsetsInsetRect(r, defaultPadding)
    }

    override public func clearButtonRect(forBounds: CGRect) -> CGRect {
        var r = super.clearButtonRect(forBounds: bounds)
        if !( text == nil || text?.characters.count == 0) {
            var top = ceil(title.font.lineHeight + hintYPadding)
            top = min(top, maxTopInset())
            r = CGRect(x:r.origin.x, y:r.origin.y + (top * 0.5), width:r.size.width, height:r.size.height)
        }
        //    return CGRectIntegral(r)
        return UIEdgeInsetsInsetRect(r, defaultPadding)
    }

    // MARK: - Public Methods

    // MARK: - Private Methods
    private func setup() {
        borderStyle = UITextBorderStyle.none
        titleActiveTextColour = tintColor
        // Set up title label
        title.alpha = 0.0
        title.font = titleFont
        title.textColor = titleTextColour
        if let str = placeholder {
            if !str.isEmpty {
                title.text = str
                title.sizeToFit()
            }
        }
        self.addSubview(title)
    }

    private func maxTopInset() -> CGFloat {
        return max(0, floor(bounds.size.height - font!.lineHeight - 4.0))
    }

    private func setTitlePositionForTextAlignment() {
        let r = textRect(forBounds: bounds)
        var x = r.origin.x
        if textAlignment == NSTextAlignment.center {
            x = r.origin.x + (r.size.width * 0.5) - title.frame.size.width
        }
        else if textAlignment == NSTextAlignment.right {
            x = r.origin.x + r.size.width - title.frame.size.width
        }
        title.frame = CGRect(x:x, y:title.frame.origin.y, width:title.frame.size.width, height:title.frame.size.height)
    }

    private func showTitle(animated: Bool) {
        let dur = animated ? animationDuration : 0
        UIView.animate(withDuration: dur, delay:0, options: [.beginFromCurrentState,.curveEaseOut], animations: {
            // Animation
            self.title.alpha = 1.0
            var r = self.title.frame
            r.origin.y = self.titleYPadding
            self.title.frame = r
        }, completion:nil)
    }

    private func hideTitle(animated: Bool) {
        let dur = animated ? animationDuration : 0
        UIView.animate(withDuration: dur, delay:0, options: [.beginFromCurrentState,.curveEaseIn], animations: {
            // Animation
            self.title.alpha = 0.0
            var r = self.title.frame
            r.origin.y = self.title.font.lineHeight + self.hintYPadding
            self.title.frame = r
        }, completion:nil)
    }
}
