//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by IMCS2 on 2/15/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var TotalCells = 10
    var img: [UIImage] = [(UIImage(named: "One") as UIImage?)!,
                          (UIImage(named: "Two") as UIImage?)!,
                          (UIImage(named: "Three") as UIImage?)!,
                          (UIImage(named: "Four") as UIImage?)!,
                          (UIImage(named: "Five") as UIImage?)!,
                          (UIImage(named: "Six") as UIImage?)!,
                          (UIImage(named: "Seven") as UIImage?)!,
                          (UIImage(named: "Eight") as UIImage?)!,
                          (UIImage(named: "Nine") as UIImage?)!,
                          (UIImage(named: "Ten") as UIImage?)!]
    
    @IBOutlet weak var ImageViewOutlet: UIImageView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TotalCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! CollectionViewCell
        cell.CellImageView.image = img[indexPath.row % img.count]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ImageViewOutlet.image = img[indexPath.row % img.count]
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == TotalCells - 1 {
            let insertIndexPath = IndexPath(item: TotalCells, section: 0)
            TotalCells += 1
            collectionView.insertItems(at: [insertIndexPath])
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

