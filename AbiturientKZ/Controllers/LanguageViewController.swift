//
//  ViewController.swift
//  AbiturientKZ
//
//  Created by Nurbek Ismagulov on 17.04.2018.
//  Copyright © 2018 theSmartest. All rights reserved.
//

import UIKit
import Cartography
import McPicker
import AKSideMenu

class LanguageViewController: UIViewController {
    let displayWidth = UIScreen.main.bounds.width
    let displayHeight = UIScreen.main.bounds.height
    
    // MARK: - Don't forget to create model for this VC
    
    // MARK: - ui components
    lazy var projectNameImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Logo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    lazy var kzLanguageLabel: UILabel = {
        let label = UILabel()
        label.text = "Тілді таңдаңыз"
        label.font = UIFont.systemFont(ofSize: 25)
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        return label
    }()
    lazy var ruLanguageLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите язык"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .white
        return label
    }()
    lazy var kzSubjectLabel: UILabel = {
        let label = UILabel()
        label.text = "Таңдаған пәндерді таңдаңыз"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .white
        return label
    }()
    lazy var ruSubjectLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите выборочные предметы"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .white
        return label
    }()
    lazy var kzDegreeLabel: UILabel = {
        let label = UILabel()
        label.text = "Антихайп таңдаңыз"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .white
        return label
    }()
    lazy var ruDegreeLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите ваше положение"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .white
        return label
    }()
    lazy var languageButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(langButtonPressed), for: .touchUpInside)
        button.backgroundColor = .white
        button.setTitleColor("0379A4".hexColor , for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitle(Arrays.languages[0][0], for: .normal)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = "000000".hexColor.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 3
        button.layer.masksToBounds = false
        return button
    }()
    lazy var subjectButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor("0379A4".hexColor, for: .normal)
        button.setTitle(Arrays.subjects[0][0], for: .normal)
        button.addTarget(self, action: #selector(subjButtonPressed), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = "000000".hexColor.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 3
        return button
    }()
    lazy var degreeButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(langButtonPressed), for: .touchUpInside)
        button.backgroundColor = .white
        button.setTitleColor("0379A4".hexColor , for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitle(Arrays.degrees[0][0], for: .normal)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = "000000".hexColor.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 3
        button.layer.masksToBounds = false
        return button
    }()
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = "F5D746".hexColor
        button.setTitle("Я СМОГУ!!!", for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button.layer.shadowColor = "000000".hexColor.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 3
        button.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        return button
    }()
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        setupViews()
        configureConstraints()
    }
    func configureView(){
        view.backgroundColor = "3278A0".hexColor
    }
    func setupViews(){
        [projectNameImage, kzLanguageLabel, ruLanguageLabel, kzSubjectLabel, ruSubjectLabel, languageButton, subjectButton, nextButton, kzDegreeLabel, ruDegreeLabel, degreeButton].forEach {(views) in
            view.addSubview(views)
        }
    }
    func configureConstraints(){
        constrain(projectNameImage, view){ pi, v in
            pi.top == v.top + (70 / 736 * displayHeight)
            pi.centerX == v.centerX
            pi.width == 343 / 414 * displayWidth
            pi.height == 56 / 736 * displayHeight
        }
        constrain(kzLanguageLabel, projectNameImage, view ){ kl, pi, v  in
            kl.top == pi.bottom + (25 / 736 * displayHeight)
            kl.centerX == v.centerX
        }
        constrain(ruLanguageLabel, kzLanguageLabel, view) { rl, kl, v in
            rl.top == kl.bottom + (5 / 736 * displayHeight)
            rl.centerX == v.centerX
        }
        constrain(languageButton, ruLanguageLabel, view){ lb, rl, v in
            lb.top == rl.bottom + (20 / 736 * displayHeight)
            lb.centerX == v.centerX
            lb.width == 344 / 414 * displayWidth
            lb.height == 50 / 736 * displayHeight
        }
        constrain(kzSubjectLabel, languageButton, view){ kl, lb, v in
            kl.top == lb.bottom + (20 / 736 * displayHeight)
            kl.centerX == v.centerX
        }
        constrain(ruSubjectLabel, kzSubjectLabel, view){ rl, kl, v in
            rl.top == kl.bottom + (5 / 736 * displayHeight)
            rl.centerX == v.centerX
        }
        constrain(subjectButton, ruSubjectLabel, view){ sb, rl, v in
            sb.top == rl.bottom + (20 / 736 * displayHeight)
            sb.centerX == v.centerX
            sb.height == 50 / 736 * displayHeight
            sb.width == 344 / 414 * displayWidth
        }
        constrain(kzDegreeLabel, ruDegreeLabel, degreeButton, subjectButton, view){ kl, rl, db, sb, v in
            kl.top == sb.bottom + (25 / 736 * displayHeight)
            kl.centerX == v.centerX
            
            rl.top == kl.bottom + (5 / 736 * displayHeight)
            rl.centerX == v.centerX
            
            db.top == rl.bottom + (20 / 736 * displayHeight)
            db.centerX == v.centerX
            db.width == 344 / 414 * displayWidth
            db.height == 50 / 736 * displayHeight
            
        }
        constrain(nextButton, degreeButton, view){ nb, db, v in
            nb.top == db.bottom + (25 / 736 * displayHeight)
            nb.centerX == v.centerX
            nb.width == 344 / 414 * displayWidth
            nb.height == 70 / 736 * displayHeight
        }
        
    }
    // MARK: - Button Actions
    @objc func langButtonPressed(){
//        McPicker.showAsPopover(data:data, fromViewController: self, sourceView: languageButton, doneHandler: { [weak self] (selections: [Int : String]) -> Void in
//            if let name = selections[0] {
//               //self?.label.text = name
//                self?.languageButton.setTitle(name, for: .normal)
//                print(name)
//            }
//            }, cancelHandler: { () -> Void in
//                print("Canceled Popover")
//        }, selectionChangedHandler: { (selections: [Int:String], componentThatChanged: Int) -> Void  in
//            let newSelection = selections[componentThatChanged] ?? "Failed to get new selection!"
//            print("Component \(componentThatChanged) changed value to \(newSelection)")
//        })
        easy(button: self.languageButton, array: Arrays.languages)
    }
    @objc func subjButtonPressed(){
        easy(button: subjectButton, array: Arrays.subjects)
    }
    @objc func degreeButtonPressed(){
        easy(button: degreeButton, array: Arrays.degrees)
    }
    func easy(button sender: UIButton, array arr: [[String]]){
        let mcPicker = McPicker(data: arr)
        
        let customLabel = UILabel()
        customLabel.textAlignment = .center
        customLabel.textColor = .white
        customLabel.font = UIFont(name:"American Typewriter", size: 30)!
        mcPicker.label = customLabel // Set your custom label
        
        let fixedSpace = McPickerBarButtonItem.fixedSpace(width: 20.0)
        let flexibleSpace = McPickerBarButtonItem.flexibleSpace()
        let fireButton = McPickerBarButtonItem.done(mcPicker: mcPicker, title: "Fire!!!") // Set custom Text
        let cancelButton = McPickerBarButtonItem.cancel(mcPicker: mcPicker, barButtonSystemItem: .cancel) // or system items
        mcPicker.setToolbarItems(items: [fixedSpace, cancelButton, flexibleSpace, fireButton, fixedSpace])
        
        mcPicker.toolbarItemsFont = UIFont(name:"American Typewriter", size: 17)!
        
        mcPicker.toolbarButtonsColor = .white
        mcPicker.toolbarBarTintColor = .darkGray
        mcPicker.pickerBackgroundColor = .gray
        mcPicker.backgroundColor = .gray
        mcPicker.backgroundColorAlpha = 0.50
        
        mcPicker.pickerSelectRowsForComponents = [
            0: [1: true]
            //1: [2: true] // [Component: [Row: isAnimated]
        ]
        
        mcPicker.show(doneHandler: { (selections: [Int : String]) -> Void in
            if let name = selections[0] {
                sender.setTitle("\(name)", for: .normal)
            }
            }, cancelHandler: {
                print("Canceled Styled Picker")
        }, selectionChangedHandler: { (selections: [Int:String], componentThatChanged: Int) -> Void  in
            let newSelection = selections[componentThatChanged] ?? "Failed to get new selection!"
            print("Component \(componentThatChanged) changed value to \(newSelection)")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Button Actions
    @objc func nextButtonPressed(){
        if degreeButton.currentTitle == "Школьник"{
            if languageButton.currentTitle == "Русский язык" {
                Arrays.titles = ["Пробные Тесты", "Викторина", "Прогресс", "Материалы", "Шпаргалки", "Мотивация"]
                
                
            }
            else{
                Arrays.titles = ["asd", "qwe", "qwer", "dfgdf", "qwe123", "bnhgfv"]
            }
            let navigationController: UINavigationController = UINavigationController.init(rootViewController: ExamYearsViewController.init())
            let leftMenuViewController: LeftMenuViewController = LeftMenuViewController.init()
            let sideMenuViewController: AKSideMenu = AKSideMenu(contentViewController: navigationController, leftMenuViewController: leftMenuViewController, rightMenuViewController: nil)
            self.present(sideMenuViewController, animated: true, completion: nil)
            
        }
        else{
            
        }
    }
    

}

