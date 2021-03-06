//
//  LeftViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 12/3/14.
//

import UIKit

enum LeftMenu: Int {
    case main = 0
    case swift
    case java
    case go
    case shows
    case mobileAccessories
//    case mobile
//    case clothes
}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}

class LeftViewController : UIViewController, LeftMenuProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    var menus = ["Home", "Women", "Men","Fashions", "Kids","Car"]
    var mainViewController: UIViewController!
    var swiftViewController: UIViewController!
    var javaViewController: UIViewController!
    var goViewController: UIViewController!
    var nonMenuViewController: UIViewController!
    var ShowsViewControllet: UIViewController!
    var MobileAccessoriesViewControllet: UIViewController!
    var MobileViewController: UIViewController!
    var clothesViewController:UIViewController!
    var imageHeaderView: ImageHeaderView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let pre=NSLocale.preferredLanguages[0]
        if(pre == "ar-US")
        {
            menus=["االدخول","نساء","الرجل","الموضة","الطفل","اكسسوار السيارات"]
        }
        else{
            menus=["Home","Women","Men","Fashions","Kids","Car"]
        }
        self.tableView.separatorColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let swiftViewController = storyboard.instantiateViewController(withIdentifier: "SwiftViewController") as! SwiftViewController
        self.swiftViewController = UINavigationController(rootViewController: swiftViewController)
        
        let javaViewController = storyboard.instantiateViewController(withIdentifier: "JavaViewController") as! JavaViewController
        self.javaViewController = UINavigationController(rootViewController: javaViewController)
        
        let goViewController = storyboard.instantiateViewController(withIdentifier: "GoViewController") as! GoViewController
        self.goViewController = UINavigationController(rootViewController: goViewController)
        
        
        let showsViewController = storyboard.instantiateViewController(withIdentifier: "showsVCID") as! ShowsViewController
        self.ShowsViewControllet = UINavigationController(rootViewController: showsViewController)
        
        let mobileAccessoriesViewController = storyboard.instantiateViewController(withIdentifier: "mobileAccessoriesVCID") as! MobileAccessoriesViewController
        self.MobileAccessoriesViewControllet = UINavigationController(rootViewController: mobileAccessoriesViewController)
        
//        let mobileViewController = storyboard.instantiateViewController(withIdentifier: "mobileVCID") as! MobileViewController
//        self.MobileViewController = UINavigationController(rootViewController: mobileViewController)
//        
//        let clothesViewController = storyboard.instantiateViewController(withIdentifier: "clothesVCID") as! clothesViewController
//         self.clothesViewController = UINavigationController(rootViewController: clothesViewController)
//        
//        
//        let nonMenuController = storyboard.instantiateViewController(withIdentifier: "NonMenuController") as! NonMenuController
        
//        NonMenuController.delegate = self
//        self.nonMenuViewController = UINavigationController(rootViewController: nonMenuController)
        
        self.tableView.registerCellClass(BaseTableViewCell.self)
        
        self.imageHeaderView = ImageHeaderView.loadNib()
        self.view.addSubview(self.imageHeaderView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.imageHeaderView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 160)
        self.view.layoutIfNeeded()
    }
    
    func changeViewController(_ menu: LeftMenu) {
        switch menu {
        case .main:
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .swift:
            self.slideMenuController()?.changeMainViewController(self.swiftViewController, close: true)
        case .java:
            self.slideMenuController()?.changeMainViewController(self.javaViewController, close: true)
        case .go:
            self.slideMenuController()?.changeMainViewController(self.goViewController, close: true)
        case .shows:
            self.slideMenuController()?.changeMainViewController(self.ShowsViewControllet, close: true)
        case .mobileAccessories:
            self.slideMenuController()?.changeMainViewController(self.MobileAccessoriesViewControllet, close: true)
//        case .mobile:
//            self.slideMenuController()?.changeMainViewController(self.MobileViewController, close: true)
//        case .clothes:
//            self.slideMenuController()?.changeMainViewController(self.clothesViewController, close: true)
            
        }
    }
}

//case .main, .swift, .java, .go ,.shows, .mobileAccessories ,.mobile, .clothes:
//return BaseTableViewCell.height()

extension LeftViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let menu = LeftMenu(rawValue: indexPath.row) {
            switch menu {
            case .main, .swift, .java, .go ,.shows, .mobileAccessories :
                return BaseTableViewCell.height()
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = LeftMenu(rawValue: indexPath.row) {
            self.changeViewController(menu)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView == scrollView {
            
        }
    }
}

extension LeftViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let menu = LeftMenu(rawValue: indexPath.row) {
            switch menu {
            case .main, .swift, .java, .go, .shows, .mobileAccessories :
                let cell = BaseTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: BaseTableViewCell.identifier)
                cell.setData(menus[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()
    }
    
    
}
