//
//  QuickTestTableViewController.swift
//  AbiturientKZ
//
//  Created by Nurbek Ismagulov on 21.04.2018.
//  Copyright © 2018 theSmartest. All rights reserved.
//

import UIKit
import Cartography

class QuickTestTableViewController: UIViewController {

    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "backgroundImage")
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImage)
        configureNavigationBar()
        configureConstraints()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    func configureNavigationBar(){
        self.navigationController?.navigationBar.backgroundColor = "3278A0".hexColor
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = "3278A0".hexColor
        self.title = Arrays.titles[1]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(self.presentLeftMenuViewController(_:)))
        self.navigationItem.leftBarButtonItem?.image = UIImage(named: "menu")
        self.navigationItem.leftBarButtonItem?.tintColor = .white
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    func configureConstraints(){
        constrain(backgroundImage, view){ bi, v in
            bi.top == v.top - 3
            bi.left == v.left - 3
            bi.right == v.right + 3
            bi.bottom == v.bottom + 3
        }
    }
}
