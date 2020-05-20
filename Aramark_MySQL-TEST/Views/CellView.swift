//
//  CellView.swift
//  Aramark_MySQL-TEST
//
//  Created by Ricky Mangerie on 5/19/20.
//  Copyright © 2020 Ricky Mangerie. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    /**
     * An extension in the UITableViewClass which creates  custom text content for the cell
     */
    func makeCustomText (model: FullMenu?)  {
        
        guard let _ = model else {
            return
        }
        
        /* Will display the holiday description, month, day and year in the textfield */
        let customText = (model!.ProductName ?? "") + ": " + (model!.ShortDescription ?? "")
        self.textLabel?.text = customText
        
    }
}
