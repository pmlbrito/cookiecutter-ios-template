//
//  LoadingOverlay.swift
//  PRODUCTNAME
//
//  Created by Pedro Brito on 20/06/2017.
//  Copyright © 2017 pmlb. All rights reserved.
//

import UIKit

public class LoadingOverlay: UIView {
    
    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay(frame: CGRect.zero)
        }
        return Static.instance
    }
    
    func showOverlay(view: UIView) {
        self.frame = view.bounds
        self.alpha = 0.0
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        
        overlayView.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
        overlayView.center = view.center
        overlayView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.centerX = overlayView.frame.size.width/2
        activityIndicator.centerY = overlayView.frame.size.height/2
        
        overlayView.addSubview(activityIndicator)
        self.addSubview(overlayView)
        view.addSubview(self)
        activityIndicator.startAnimating()
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
            self.alpha = 0.7
        }, completion: { finished in
        })
    }
    
    public func hideOverlayView() {

        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
            self.alpha = 0.0
        }, completion: { finished in
            self.activityIndicator.stopAnimating()
            self.removeFromSuperview()
        })
    }
}

