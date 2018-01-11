//
//  MobileViewController.swift
//  SlideMenuControllerSwift
//
//  Created by CasperonIOS on 10/24/17.
//  Copyright © 2017 Yuji Hato. All rights reserved.
//

import UIKit

class MobileViewController: UIViewController {

    @IBOutlet weak var mobileWebView: UIWebView!
    var url_str:String = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        //add url in global varaible url_str
        let url=URL(string: url_str)
        let urlRequest=URLRequest(url: url!)
        mobileWebView.loadRequest(urlRequest)
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
