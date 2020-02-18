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
    var viewModel: CustomSearchModel?
    
    init(frame: CGRect, font: UIFont, textColor: UIColor) {
        super.init(frame: frame)
        
        viewModel = CustomSearchModel()
        self.frame = frame
        preferredFont = font
        preferredTextColor = textColor
        searchBarStyle = .prominent
        isTranslucent = false
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override public func draw(_ rect: CGRect) {
        viewModel?.drawSearchBar(bar: self)
        super.draw(rect)
    }
    
}
