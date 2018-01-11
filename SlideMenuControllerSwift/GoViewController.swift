//
//  GoViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/19/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import UIKit

class GoViewController: UIViewController {
    
    @IBOutlet weak var electronic: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //fashions
        let url=URL(string: "https://www.aswaqqnet.com/web/en/goodsview.php?edit_id=964&edit_id2=1")
        let url2=URL(string: "https://www.aswaqqnet.com/web/ar/goodsview.php?edit_id=964&edit_id2=1")
        let pre=NSLocale.preferredLanguages[0]
        if(pre == "ar-US")
        {
            let urlRequest=URLRequest(url: url2!)
            electronic.loadRequest(urlRequest)
        }
        else
        {
            let urlRequest=URLRequest(url: url!)
            electronic.loadRequest(urlRequest)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }
}
