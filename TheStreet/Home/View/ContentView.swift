//
//  ViewController.swift
//  TheStreet
//
//  Created by Ashraful Islam Rupu on 7/18/23.
//

import UIKit

class ContentView: UIViewController {
    private let  categoryServicesVM = CategoryServicesVM()
    
    
    
    private let categoryStatus : UILabel = {
        let pt = UILabel()
        //pt.text = "Category Status: \(categoryServicesVM.responseStatus?.message ?? "Not found")"
        pt.textColor = .green
        return pt
    }()
    
    private let subCategoryStatus : UILabel = {
        let pt = UILabel()
        //pt.text = "Sub Category Status: "
        pt.textColor = .green
        return pt
    }()
    
    private let categoryButton : UIButton = {
        let cb = UIButton(type: .system)
        cb.setTitle("Category", for: .normal)
        cb.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
        cb.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
        cb.layer.cornerRadius = 5
        cb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        cb.setTitleColor(.white, for: .normal)
        return cb
    }()
    
    private let subCategoryButton : UIButton = {
        let scb = UIButton()
        scb.setTitle("Sub Category", for: .normal)
        scb.addTarget(self, action: #selector(subCategoryButtonTapped), for: .touchUpInside)
        scb.backgroundColor = UIColor.rgb(red: 160, green: 104, blue: 244)
        scb.layer.cornerRadius = 5
        return scb
    }()
    
    private let createShopButton : UIButton = {
        let csp = UIButton()
        csp.setTitle("Create Shop", for: .normal)
        csp.addTarget(self, action: #selector(createShopButtonTapped), for: .touchUpInside)
        csp.backgroundColor = UIColor.rgb(red: 120, green: 94, blue: 144)
        csp.layer.cornerRadius = 5
        return csp
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        design()
        updateStatus()
        
        
    }
    
    @objc fileprivate func categoryButtonTapped(){
        print("categoryButtonTapped")
        categoryServicesVM.getCategories()
        updateStatus()
        
    }
    
    @objc func subCategoryButtonTapped(){
        print("sign up")
        categoryServicesVM.getuSubCategories(categoryId: categoryServicesVM.responseStatus?.data?.categories?.first?._id ?? "")
        updateStatus()
        //
        //        let navController = UINavigationController(rootViewController: UpController())
        //        navController.modalPresentationStyle = .fullScreen
        //        present(navController, animated: true, completion: nil)
    }
    
    @objc fileprivate func createShopButtonTapped(){
        print("createShopButtonTapped")
        categoryServicesVM.createShop()
    }
    
    func design(){
        let stack = UIStackView(arrangedSubviews: [categoryButton,categoryStatus,subCategoryButton,subCategoryStatus,createShopButton])
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: nil, centerX: nil, centerY: nil, width: nil, height: nil, topConstant: 140, leadingConstant: 12, trailingConstant: 12, bottomConstant: 0, centerXConstant: 0, centerYConstant: 0, widthConstant: 200, heightConstant: 200)
        
//        view.addSubview(subCategoryButton)
//        subCategoryButton.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: nil, centerX: nil, centerY: nil, width: nil, height: nil, topConstant: 140, leadingConstant: 12, trailingConstant: 12, bottomConstant: 0, centerXConstant: 0, centerYConstant: 0, widthConstant: 200, heightConstant: 200)
    }
    
    func updateStatus(){
        categoryStatus.text = "Category Status: \(categoryServicesVM.responseStatus?.message ?? "Not found")"
        subCategoryStatus.text = "Sub Category Status: \(categoryServicesVM.responseStatus2?.message ?? "Not found")"
    }
    
}


