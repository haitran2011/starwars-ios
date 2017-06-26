//
//  UIView+Loading.swift
//  StarWars
//
//  Created by Matthew Delves on 26/6/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import UIKit

extension UIView {
    public func showLoading() -> LoadingView {
        let loadingView = LoadingView(frame: .zero)

        addSubview(loadingView)

        let centerX = NSLayoutConstraint(
            item: loadingView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0
        )

        let centerY = NSLayoutConstraint(
            item: loadingView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerY,
            multiplier: 1.0,
            constant: 0.0
        )

        addConstraint(centerX)
        addConstraint(centerY)

        return loadingView
    }

    public func hideLoading(_ loadingView: LoadingView) {
        UIView.animate(
            withDuration: 0.5,
            animations: {
                loadingView.alpha = 0
        }) { completed in
            loadingView.removeFromSuperview()
        }
    }
}
