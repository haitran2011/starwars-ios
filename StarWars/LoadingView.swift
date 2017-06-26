//
//  LoadingView.swift
//  StarWars
//
//  Created by Matthew Delves on 26/6/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import UIKit

@IBDesignable final public class LoadingView: UIView {
    @IBOutlet weak var activityView: UIActivityIndicatorView!

    var nibName: String {
        return String(describing: LoadingView.self)
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    public override func draw(_ rect: CGRect) {
        layer.cornerRadius = 5
        clipsToBounds = true
    }

    fileprivate func setup() {
        addViewFromXib()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    internal func addViewFromXib() {
        if let xibView = loadFromXib() {
            addSubview(xibView)
            constrainView(xibView, toSuperView: self)
        }
    }

    internal func loadFromXib() -> UIView? {
        let xibView = UINib(nibName: nibName, bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil).first
        return xibView as? UIView
    }

    internal func constrainView(_ view: UIView, toSuperView superView: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        superView.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|[view]|",
                options: [.alignAllCenterX, .alignAllCenterY],
                metrics: nil,
                views: ["view": view]
            )
        )

        superView.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|[view]|",
                options: [.alignAllCenterX, .alignAllCenterY],
                metrics: nil,
                views: ["view": view]
            )
        )
    }
}
