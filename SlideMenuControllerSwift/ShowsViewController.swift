//
//  ShowsViewController.swift
//  SlideMenuControllerSwift
//
//  Created by CasperonIOS on 10/24/17.
//  Copyright © 2017 Yuji Hato. All rights reserved.
//

import UIKit

class ShowsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var showsWebView: UIWebView!
    var array = ["Clothes","Accessories","Shoes"]
    var url = ["http://www.aswaqqnet.com/web/en/goodsview.php?edit_id=459&edit_id2=1","http://www.aswaqqnet.com/web/en/goodsview.php?edit_id=933&edit_id2=1","http://www.aswaqqnet.com/web/en/goodsview.php?edit_id=967&edit_id2=1"]
    
    var url2 = ["http://www.aswaqqnet.com/web/ar/goodsview.php?edit_id=459&edit_id2=1","http://www.aswaqqnet.com/web/ar/goodsview.php?edit_id=933&edit_id2=1","http://www.aswaqqnet.com/web/ar/goodsview.php?edit_id=967&edit_id2=1"]

    override func viewDidLoad() {
        super.viewDidLoad()
        let nibName = UINib(nibName: "CategoryTableViewCell", bundle:nil)
        self.tableview.register(nibName, forCellReuseIdentifier: "CategoryTableViewCell")
        tableview.separatorStyle = .none
//        let url=URL(string: "https://www.aswaqqnet.com/web/en/goodsview.php?edit_id=967&edit_id2=1")
//        let urlRequest=URLRequest(url: url!)
//        showsWebView.loadRequest(urlRequest)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
