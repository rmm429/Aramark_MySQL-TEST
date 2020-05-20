//
//  ViewController.swift
//  Aramark_MySQL-TEST
//
//  Created by Ricky Mangerie on 5/19/20.
//  Copyright © 2020 Ricky Mangerie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let model = FullMenuModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        model.delegate = self
    }
    
    @IBAction func getFullMenu(_ sender: Any) {
        model.downloadFullMenu(url: URLServices.fullMenu)
    }


}

extension ViewController: Downloadable { // implements our Downloadable protocol
    
    /**
     * Gets called whenever a part of the requested URL has been downloaded
     */
    func didReceiveData(data: Any) {
        
        /* The data model has been dowloaded at this point and is passed to the Holidays table view controller */
       DispatchQueue.main.sync {
        
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondViewController = storyboard.instantiateViewController(withIdentifier: "fullmenuID") as! FullMenuViewController
        
            secondViewController.model = (data as! [FullMenu])
            self.present(secondViewController, animated: true, completion: nil)
        
        }
        
    }
    
}

