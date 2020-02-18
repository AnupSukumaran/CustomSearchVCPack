//
//  CustomSearchModel.swift
//  CustomSearchBar
//
//  Created by Manu Puthoor on 18/02/20.
//  Copyright © 2020 Appcoda. All rights reserved.
//

import UIKit

class CustomSearchModel: NSObject {
    
    func drawSearchBar(bar: CustomSearchBar) {
        if let index = indexOfSearchFieldInSubviews(bar) {
        
            let searchField: UITextField = (bar.subviews[0]).subviews[index] as! UITextField
            searchField.frame = CGRect(x: 5.0, y: 5.0, width: bar.frame.size.width - 10.0, height: bar.frame.size.height - 10.0)
            searchField.font = bar.preferredFont
                 searchField.textColor = bar.preferredTextColor
                 searchField.backgroundColor = bar.barTintColor
             }
             
             let startPoint = CGPoint(x: 0.0, y: bar.frame.size.height)
             let endPoint = CGPoint(x: bar.frame.size.width, y: bar.frame.size.height)
             let path = UIBezierPath()
             path.move(to: startPoint)
             path.addLine(to: endPoint)
             
             let shapeLayer = CAShapeLayer()
             shapeLayer.path = path.cgPath
             shapeLayer.strokeColor = bar.preferredTextColor.cgColor
             shapeLayer.lineWidth = 2.5
             
             bar.layer.addSublayer(shapeLayer)
    }
    
    func indexOfSearchFieldInSubviews(_ bar: CustomSearchBar) -> Int! {
    
          var index: Int!
        let searchBarView = bar.subviews[0]
          
          for i in 0...searchBarView.subviews.count {
              if searchBarView.subviews[i].isKind(of: UITextField.self) {
                  index = i
                  break
              }
          }
          
          return index
      }

}
