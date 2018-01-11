//
//  SwiftViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/19/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//



import UIKit

class SwiftViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var home: UIWebView!
    var array = ["Clothes","Accessories","Cosmetics","Night Wear"]
    var url = ["https://www.aswaqqnet.com/web/en/goodsview.php?edit_id=598&edit_id2=0","https://www.aswaqqnet.com/web/en/goodsview.php?edit_id=964&edit_id2=0","https://www.aswaqqnet.com/web/en/goodsview.php?edit_id=952&edit_id2=0","https://www.aswaqqnet.com/web/en/goodsview.php?edit_id=978&edit_id2=0"]
    
    var url2 = ["https://www.aswaqqnet.com/web/ar/goodsview.php?edit_id=598&edit_id2=0","https://www.aswaqqnet.com/web/ar/goodsview.php?edit_id=964&edit_id2=0","https://www.aswaqqnet.com/web/ar/goodsview.php?edit_id=952&edit_id2=0","https://www.aswaqqnet.com/web/ar/goodsview.php?edit_id=978&edit_id2=0"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibName = UINib(nibName: "CategoryTableViewCell", bundle:nil)
        self.tableview.register(nibName, forCellReuseIdentifier: "CategoryTableViewCell")
        tableview.separatorStyle = .none
//        let url=URL(string: "https://www.aswaqqnet.com/web/en/goodsview.php?edit_id=598&edit_id2=0")
//        let urlRequest=URLRequest(url: url!)
//        home.loadRequest(urlRequest)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CategoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
        cell.content.text = array[indexPath.row]
        //cell.content_image.image = UIImage(named: <#T##String#>)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pre=NSLocale.preferredLanguages[0]
        let pass_url:String
        if(pre == "ar-US")
        {
            pass_url = url2[indexPath.row]
        }
        else{
            pass_url=url[indexPath.row]
        }
        let push = storyboard?.instantiateViewController(withIdentifier: "mobileVCID") as! MobileViewController
        push.url_str = pass_url
        self.navigationController?.pushViewController(push, animated: true)
    }
    
}
