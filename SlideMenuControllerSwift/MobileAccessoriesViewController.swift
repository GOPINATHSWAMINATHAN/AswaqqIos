//
//  MobileAccessoriesViewController.swift
//  SlideMenuControllerSwift
//
//  Created by CasperonIOS on 10/24/17.
//  Copyright © 2017 Yuji Hato. All rights reserved.
//

import UIKit

class MobileAccessoriesViewController: UIViewController {

    @IBOutlet weak var mobileAccessWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //cars
        let url=URL(string: "https://www.aswaqqnet.com/web/en/goodsview.php?edit_id=979&edit_id2=1")
        let url2=URL(string: "https://www.aswaqqnet.com/web/ar/goodsview.php?edit_id=979&edit_id2=1")
        let pre=NSLocale.preferredLanguages[0]
        if(pre == "ar-US")
        {
            let urlRequest=URLRequest(url: url2!)
            mobileAccessWebView.loadRequest(urlRequest)
        }
        else{
            let urlRequest=URLRequest(url: url!)
            mobileAccessWebView.loadRequest(urlRequest)
        }
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
