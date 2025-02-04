//
//  PersonalCollectionViewCell.swift
//  IG_practice
//
//  Created by 王宜婕 on 2025/1/21.
//

import UIKit

class PersonalCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "\(PersonalCollectionViewCell.self)"
    
    @IBOutlet weak var PostsImageView: UIImageView!
    
    @IBOutlet weak var StorysImageView: UIImageView!
    
}
