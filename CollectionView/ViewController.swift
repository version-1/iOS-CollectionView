//
//  ViewController.swift
//  CollectionView
//
//  Created by Administlator on 2020/08/21.
//  Copyright © 2020 Administlator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var addBtn: UIBarButtonItem!
    
    var restaurantCollectionView:UICollectionView?
    var filteringCollectionView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        self.navigationItem.title = "My Restaurants"
        
        initRestaulantCollection()
    }
    
    func initRestaulantCollection () {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        
        restaurantCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        restaurantCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        restaurantCollectionView?.backgroundColor = UIColor.white
        
        filteringCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        filteringCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        filteringCollectionView?.backgroundColor = UIColor.white
        
        restaurantCollectionView?.dataSource = self
        restaurantCollectionView?.delegate = self
        filteringCollectionView?.dataSource = self
        filteringCollectionView?.delegate = self
        let hoge: UIView = filteringCollectionView ?? view
        NSLayoutConstraint.activate([hoge.leadingAnchor.constraint(equalTo: hoge.trailingAnchor, constant: 15)])
        view.addSubview(restaurantCollectionView ?? UICollectionView())
        view.addSubview(filteringCollectionView ?? UICollectionView())
        
        self.view = view
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9 // How many cells to display
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        myCell.backgroundColor = collectionView == self.restaurantCollectionView ? UIColor.blue : UIColor.red
            
        return myCell
    }
}
extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }
}
