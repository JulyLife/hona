//
//  OtherUsersViewController.swift
//  Hona
//
//  Created by ghanima on 10/24/20.
//  Copyright © 2020 ghanima. All rights reserved.
//

import UIKit

struct Item {
    var imageName: String
}
class OtherUsersViewController: UIViewController {
   
//MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [Item] = [Item(imageName: "img0"),
                         Item(imageName: "img1"),
                         Item(imageName: "img2"),
                         Item(imageName: "img3"),
                         Item(imageName: "img4"),
                         Item(imageName: "img5"),
                         Item(imageName: "img6"),
                         Item(imageName: "img7"),
                         Item(imageName: "img8")]
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
  let cellIdentifire = "ItemCollectionViewCell"
    
    let viewImageSegueIdentifier = "viewImageSegueIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupCollectionView()
        setupCollectionViewItemSize()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let item = sender as! Item
        if segue.identifier == viewImageSegueIdentifier{
            if let vc = segue.destination as? ImageViewerViewController{
                vc.imageName = item.imageName
            }
        }
    }
    
     private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifire)
    }
    
    private func setupCollectionViewItemSize(){
        let customLayout = CustomLayout()
        customLayout.delegate = self
        customLayout.numberOfColumns = 2
        customLayout.cellPadding = 5
        collectionView.collectionViewLayout = customLayout
        
    }
    
    
}

extension OtherUsersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifire, for: indexPath) as! ItemCollectionViewCell
             
        cell.imageView.image = UIImage(named: items[indexPath.item].imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        performSegue(withIdentifier: viewImageSegueIdentifier, sender: item)
    }
    
}

extension OtherUsersViewController: CustomLayoutDelegate{
    func collectionView(_ collectionView: UICollectionView, sizeOfPhotoAtIndexPath indexPath: IndexPath) -> CGSize {
        return UIImage(named: items[indexPath.item].imageName)!.size
    }
}
