//
//  clothesViewController.swift
//  SlideMenuControllerSwift
//
//  Created by CasperonIOS on 10/24/17.
//  Copyright © 2017 Yuji Hato. All rights reserved.
//

import UIKit

class clothesViewController: UIViewController {

    @IBOutlet weak var clothesWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url=URL(string: "https://www.aswaqqnet.com/web/en/goodsview.php?edit_id=933&edit_id2=1")
        let urlRequest=URLRequest(url: url!)
        clothesWebView.loadRequest(urlRequest)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
