//
//  ViewController.swift
//  Convert List To Grid Demo
//
//  Created by Pawan kumar on 16/05/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let itemLists = ["Almond", "Anise", "Apricot", "Arrowroot", "Betel-nut", "Cantaloupe Seeds", "Cashew nut", "Chestnut", "Coconut", "Cudpahnut", "Currant", "Dates Dried", "Dates", "Fig", "Flax seeds", "Groundnuts, Peanuts,Lotus Seeds Pop,Gorgon Nut Puffed Kernel", "Nut, Walnuts", "Pine Nut", "Pistachio", "Prunes", "Pumpkin Seeds", "Saffron", "Sesame Seeds", "Sugar candy", "Watermelon Seeds"]
    
    @IBOutlet weak var collectionView: UICollectionView!

    //Default Set ListCell if Value is 1 other wise Show GridCell
    var listType: CGFloat = 1
    
    @IBAction func gridListButtonTap(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            //List
            self.listType = 1
            print("Default Button Called 1")
        case 2:
            //Grid
            self.listType = 2
            print("Default Button Called 2")
        case 3:
            //Grid
            self.listType = 3
            print("Default Button Called 3")
        default:
            //Default
            print("Default Button Called")
        }
        
        //Reload List items
        self.collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let listCellNib = UINib(nibName: GridCell.reuseIdentifier_ListCell, bundle: nil)
        self.collectionView.register(listCellNib, forCellWithReuseIdentifier: GridCell.reuseIdentifier_ListCell)
        
        let gridCellNib = UINib(nibName: GridCell.reuseIdentifier_GridCell, bundle: nil)
        self.collectionView.register(gridCellNib, forCellWithReuseIdentifier: GridCell.reuseIdentifier_GridCell)
        
        self.collectionView.backgroundColor = UIColor.clear
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
       //FlowLayout for Managed Grid and List
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //.horizontal
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 5.0
        layout.minimumInteritemSpacing = 5.0
        self.collectionView.setCollectionViewLayout(layout, animated: true)
        
        //Reload List items
        self.collectionView.reloadData()
    }
}

extension ViewController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        //For List & For Grid ( 1 -> List & 2 -> Grid)
        let cellWidth: CGFloat = self.collectionView.frame.size.width / self.listType  - 10
        let cellheight: CGFloat = 100
        let cellSize = CGSize(width: cellWidth , height:cellheight)
        
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemLists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if self.listType == 1 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCell.reuseIdentifier_ListCell, for: indexPath as IndexPath) as! GridCell
            self.configureCell(cell: cell, forIndexPath: indexPath)
            return cell
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCell.reuseIdentifier_GridCell, for: indexPath as IndexPath) as! GridCell
            self.configureCell(cell: cell, forIndexPath: indexPath)
            return cell
        }
    }
    
    func configureCell(cell: GridCell, forIndexPath indexPath: IndexPath) {
        
        let title = itemLists[indexPath.row]
        cell.titleLabel.text = title
        
        //Cell Corner Radius
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        
        //ImageView Corner Radius
        cell.userImageView.layer.borderColor = UIColor.lightGray.cgColor
        cell.userImageView.layer.borderWidth = 1
        cell.userImageView.layer.cornerRadius = 5
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("didSelectItemAt:-\(indexPath.row)")
        
    }
}

