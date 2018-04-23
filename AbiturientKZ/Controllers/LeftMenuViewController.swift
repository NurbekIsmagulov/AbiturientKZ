//
//  LeftMenuViewController.swift
//  AbiturientKZ
//
//  Created by Nurbek Ismagulov on 21.04.2018.
//  Copyright © 2018 theSmartest. All rights reserved.
//

import UIKit
import Cartography
import AKSideMenu

class LeftMenuViewController: UIViewController {
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        return image
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 15 / 414 * UIScreen.main.bounds.width, y: (self.view.frame.size.height - 80 * 5) / 2.0, width: self.view.frame.size.width, height: 80 * 5), style: .plain)
        tableView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isOpaque = false
        tableView.backgroundColor = .clear
        tableView.backgroundView = nil
        tableView.separatorStyle = .none
        tableView.bounces = false
       // tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(backgroundImage)
        view.addSubview(tableView)
        configureConstraints()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureConstraints(){
//        constrain(tableView, view){ tv, v in
//            tv.edges == v.edges
//        }
        constrain(backgroundImage, view){ bi, v in
            bi.edges == v.edges
        }
    }
}

extension LeftMenuViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier: String = "Cell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
            cell!.backgroundColor = .clear
            cell!.textLabel?.font = UIFont(name: "Noteworthy", size: 20)
            cell!.textLabel?.textColor = .white
            cell!.textLabel?.highlightedTextColor = .lightGray
            cell!.selectedBackgroundView = UIView()
        }
        
        
        cell!.textLabel?.text = Arrays.titles[indexPath.row]
        cell!.imageView?.image = UIImage(named: Arrays.images[indexPath.row])
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            self.sideMenuViewController!.setContentViewController(UINavigationController(rootViewController: ExamYearsViewController()), animated: true)
            self.sideMenuViewController!.hideMenuViewController()
            
        case 1:
            self.sideMenuViewController!.setContentViewController(UINavigationController(rootViewController: QuickTestTableViewController()), animated: true)
            self.sideMenuViewController!.hideMenuViewController()
            
        case 2:
            self.sideMenuViewController!.setContentViewController(UINavigationController(rootViewController: ProgressViewController()), animated: true)
            self.sideMenuViewController!.hideMenuViewController()
            
        case 3:
            self.sideMenuViewController!.setContentViewController(UINavigationController(rootViewController: MaterialsViewController()), animated: true)
            self.sideMenuViewController!.hideMenuViewController()
            
        case 4:
            self.sideMenuViewController!.setContentViewController(UINavigationController(rootViewController: CheatViewController()), animated: true)
            self.sideMenuViewController!.hideMenuViewController()
            
        case 5:
            self.sideMenuViewController!.setContentViewController(UINavigationController(rootViewController: MotivationViewController()), animated: true)
            self.sideMenuViewController!.hideMenuViewController()
            
        default:
            break
        }
    }
}
