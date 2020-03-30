//
//  SearchViewModel.swift
//  CustomSearchBar
//
//  Created by Manu Puthoor on 18/02/20.
//  Copyright © 2020 Appcoda. All rights reserved.
//

import UIKit


public class SearchViewModel: NSObject {
    
    public var customSearchController: CustomSearchController!
    var vc: UIViewController!
    var tableTopConstraint: NSLayoutConstraint!
    var defaultFrame:CGRect!
    let defaultFont = UIFont(name: "Futura", size: 16.0)
    
    public init(vc: UIViewController, tableTopConstraint: NSLayoutConstraint? = nil) {
        super.init()
        self.vc = vc
        self.tableTopConstraint = tableTopConstraint
        self.defaultFrame = CGRect(x: 0.0, y: 0.0, width: vc.view.frame.width, height: 50.0)
    }
    
   public func loadListOfCountries( tblSearchResults: UITableView) -> [String] {
        
        let dataArray = [String]()
        let pathToFile = Bundle.main.path(forResource: "countries", ofType: "txt")
        
        if let path = pathToFile {
            let countriesString = try! String(contentsOfFile: path, encoding: String.Encoding.utf8)
            defer {
                tblSearchResults.reloadData()
            }
            let data = countriesString.components(separatedBy: "\n")
            return data
        }
        return dataArray
    }

    public func returnCell(_ tableView: UITableView,cellID: String, _ indexPath: IndexPath,_ shouldShowSearchResults: Bool, arrays: (data :[String], filter: [String]) ) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath as IndexPath)
        
        shouldShowSearchResults ?
        (cell.textLabel?.text = arrays.filter[indexPath.row]) :
        (cell.textLabel?.text = arrays.data[indexPath.row])
        
        return cell
    }
        
    public func filterData(_ searchText: String, dataArray:[String] ) -> [String] {
        
        var filteredData = [String]()

        filteredData = dataArray.filter({ (country) -> Bool in
            let countryText: NSString = country as NSString
            
            return (countryText.range(of: searchText, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
        })
        
        return filteredData
            
    }
    
    public func configureCustomSearchController(view: UIView, searchBarTextColor: UIColor = .orange, searchBarTintColor: UIColor = .black, placeHolderString: String = "Search", frame: CGRect? = nil, font: UIFont? = nil, lineColor: UIColor = .black ){
        
        customSearchController = CustomSearchController(searchResultsController: vc, searchBarFrame: frame ?? defaultFrame , searchBarFont: font ?? defaultFont!, searchBarTextColor: searchBarTextColor, searchBarTintColor: searchBarTintColor, lineColor: lineColor)
          
          customSearchController.customSearchBar.placeholder = placeHolderString
          
          let topConstraint = NSLayoutConstraint(item: customSearchController.customSearchBar!, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
          let leftConstraint = NSLayoutConstraint(item: customSearchController.customSearchBar!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
          let rightConstraint = NSLayoutConstraint(item: customSearchController.customSearchBar!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
          let heightConstraint = NSLayoutConstraint(item: customSearchController.customSearchBar!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: view.frame.height)
          customSearchController.customSearchBar.translatesAutoresizingMaskIntoConstraints = false
          customSearchController.customSearchBar.addConstraint(heightConstraint)
          
          view.addSubview(customSearchController.customSearchBar)
          view.addConstraints([topConstraint, leftConstraint, rightConstraint])
          customSearchController.customDelegate = vc as? CustomSearchControllerDelegate
          
      }
    
}
