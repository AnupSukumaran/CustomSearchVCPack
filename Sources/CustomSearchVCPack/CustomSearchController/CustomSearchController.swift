//
//  CustomSearchController.swift
//  CustomSearchBar
//
//  Created by Gabriel Theodoropoulos on 8/9/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

public protocol CustomSearchControllerDelegate: class {
    func didStartSearching()
    func didTapOnSearchButton()
    func didTapOnCancelButton()
    func didChangeSearchText(searchText: String)
    
}


public class CustomSearchController: UISearchController {

    public var customSearchBar: CustomSearchBar!
    public var customDelegate: CustomSearchControllerDelegate!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }

    public init(searchResultsController: UIViewController!, searchBarFrame: CGRect, searchBarFont: UIFont, searchBarTextColor: UIColor, searchBarTintColor: UIColor, lineColor: UIColor) {
        super.init(searchResultsController: searchResultsController)
        
        configureSearchBar(frame: searchBarFrame, font: searchBarFont, textColor: searchBarTextColor, bgColor: searchBarTintColor, lineColor: lineColor)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func configureSearchBar(frame: CGRect, font: UIFont, textColor: UIColor, bgColor: UIColor, lineColor: UIColor) {
        customSearchBar = CustomSearchBar(frame: frame, font: font , textColor: textColor, lineColor: lineColor)
        
        customSearchBar.barTintColor = bgColor
        customSearchBar.tintColor = textColor
        customSearchBar.showsBookmarkButton = false
        customSearchBar.showsCancelButton = false
        customSearchBar.delegate = self
    }
    
}


