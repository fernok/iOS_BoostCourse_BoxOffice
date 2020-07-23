//
//  CollectionViewController.swift
//  BoxOffice
//
//  Created by Hyuhng Min Kim on 2020/07/22.
//  Copyright © 2020 Hyuhng Min Kim. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    @IBOutlet var settingsButton: UIBarButtonItem!
    
    @IBAction func touchUpSettingsButton(_ sender: UIBarButtonItem) {
        selectOrderingStyle(controller: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.topItem?.title = "예매율"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
