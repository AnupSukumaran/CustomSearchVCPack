//
//  UIViewController+Ext.swift
//  CustomSearchBar
//
//  Created by Manu Puthoor on 18/02/20.
//  Copyright © 2020 Appcoda. All rights reserved.
//

import UIKit

extension UIViewController {
    var topbarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height + (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}
