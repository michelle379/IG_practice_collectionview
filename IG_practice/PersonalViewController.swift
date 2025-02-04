//
//  PersonalViewController.swift
//  IG_practice
//
//  Created by 王宜婕 on 2025/1/21.
//

import UIKit

class PersonalViewController: UIViewController {

    @IBOutlet weak var storyCollectionView: UICollectionView!
    @IBOutlet weak var postsCollectionView: UICollectionView!
    
    var storys : [String] = ["pic1","pic2","pic3","pic4","pic5","pic6","pic7"]
    var posts : [Posts] = [Posts(imagesname: ["chiikawa1"], title: "test1", likesnum: 13, commentsnum: 35, sentsnum: 532, hashtages: ["#test"]),
                           Posts(imagesname: ["chiikawa2"], title: "test1", likesnum: 123, commentsnum: 345, sentsnum: 532, hashtages: ["#test"]),
                           Posts(imagesname: ["chiikawa3"], title: "test1", likesnum: 123, commentsnum: 345, sentsnum: 532, hashtages: ["#test"]),
                           Posts(imagesname: ["chiikawa1","chiikawa2","chiikawa3","chiikawa4"], title: "test1", likesnum: 123, commentsnum: 345, sentsnum: 532, hashtages: ["#test"])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCellSize()
        // Do any additional setup after loading the view.
    }
    
    func configureCellSize(){
        if let postsLayout = postsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            postsLayout.minimumInteritemSpacing = 4
            postsLayout.minimumLineSpacing = 4
            postsLayout.estimatedItemSize = .zero // 確保不使用自動尺寸
        }
        
        if let storyLayout = storyCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            storyLayout.scrollDirection = .horizontal
            storyLayout.minimumLineSpacing = 0
            storyLayout.minimumInteritemSpacing = 0
        }
    }
    
    
    @IBSegueAction func ShowPostDetail(_ coder: NSCoder) -> PersonalDetailViewController? {
        guard let item = postsCollectionView.indexPathsForSelectedItems?.first?.item else { return nil }
        let controller = PersonalDetailViewController(coder: coder)!
        controller.selectPost = posts[item]
        return controller
    }
    

    
    

}
extension PersonalViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == storyCollectionView{
            return storys.count
        }else{
            return posts.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonalCollectionViewCell.reuseIdentifier, for: indexPath) as! PersonalCollectionViewCell
        if collectionView == storyCollectionView {
            let storyimg = storys[indexPath.item]
            cell.StorysImageView.image = UIImage(named: "\(storyimg)")

        } else {
            let postimg = posts[indexPath.item]
            cell.PostsImageView.image = UIImage(named: "\(postimg.imagesname[0])")
        }
        
        return cell
    }
    
    
}
//設定cell尺寸
extension PersonalViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == storyCollectionView {
            // Story 的 Cell 直接佔滿整個 CollectionView 大小
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
        } else {
            // Posts 的 Cell 設定為 3 欄排列
            let itemSpacing: CGFloat = 4
            let columns: CGFloat = 3
            
            // 計算每個 Cell 的寬度
            let totalSpacing = itemSpacing * (columns - 1)
            let width = floor((collectionView.bounds.width - totalSpacing) / columns)
            
            return CGSize(width: width, height: width) // 高度等於寬度，保持正方形
        }
    }
}


#Preview {
    UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
}

