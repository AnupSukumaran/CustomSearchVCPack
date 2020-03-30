//
//  CustomSearchBar.swift
//  CustomSearchBar
//
//  Created by Gabriel Theodoropoulos on 8/9/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

public class CustomSearchBar: UISearchBar {

    var preferredFont: UIFont!
    var preferredTextColor: UIColor!
    var preferredLineColor: UIColor!
    
    init(frame: CGRect, font: UIFont, textColor: UIColor, lineColor: UIColor) {
        super.init(frame: frame)
        self.frame = frame
        preferredFont = font
        preferredTextColor = textColor
        preferredLineColor = lineColor
        searchBarStyle = .prominent
        isTranslucent = false

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override public func draw(_ rect: CGRect) {
        drawSearchBar(bar: self)
        super.draw(rect)
    }
    
}


