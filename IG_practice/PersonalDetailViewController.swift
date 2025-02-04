//
//  PersonalDetailViewController.swift
//  IG_practice
//
//  Created by 王宜婕 on 2025/1/21.
//

import UIKit

class PersonalDetailViewController: UIViewController, UICollectionViewDataSource {
    @IBOutlet weak var PostDetailCollectionView: UICollectionView!
    var selectPost: Posts!

    @IBOutlet weak var PostDetailPageControl: UIPageControl!
    @IBOutlet var HashTagLabels: [UILabel]!
    @IBOutlet weak var SendLabel: UILabel!
    @IBOutlet weak var MessageLabel: UILabel!
    @IBOutlet weak var LikesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    func updateUI(){
        LikesLabel.text = "\(selectPost.likesnum)"
        MessageLabel.text = "\(selectPost.commentsnum)"
        SendLabel.text = "\(selectPost.sentsnum)"
        if selectPost.imagesname.count > 1 {
            PostDetailPageControl.isHidden = false
            PostDetailPageControl.currentPage = 0
            PostDetailPageControl.numberOfPages = selectPost.imagesname.count
        }else{
            PostDetailPageControl.isHidden = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectPost.imagesname.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonalDetailCollectionViewCell.reuseIdentifier, for: indexPath) as! PersonalDetailCollectionViewCell
        
        
        return cell
    }

}
