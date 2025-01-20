//
//  ViewController.swift
//  IG_practice
//
//  Created by 王宜婕 on 2025/1/15.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate {

    @IBOutlet weak var FirstImageView: UIImageView!
    @IBOutlet weak var PostScrollView: UIScrollView!
    @IBOutlet weak var PageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func pickpage(_ sender: UIPageControl) {
        let point = CGPoint(x: PostScrollView.bounds.width * CGFloat(sender.currentPage), y: 0)
        PostScrollView.setContentOffset(point, animated: true)
        print(sender.currentPage)
        //設定拖拉page control
        PageControl.allowsContinuousInteraction = true
    }
    
    //圖片縮放
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
           for pageView in PostScrollView.subviews {
              if pageView.isKind(of: UIView.self){
                 return pageView
              }
           }
           return nil
        }

    
    //page顏色更改
    //在停止滑動時呼叫
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = PostScrollView.contentOffset.x / PostScrollView.frame.width
        print(PostScrollView.contentOffset.x, PostScrollView.frame.width)
        PageControl.currentPage = Int(page)
    }
}

//extension ViewController: UIScrollViewDelegate {
//    //在停止滑動時呼叫
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let page = scrollView.contentOffset.x / scrollView.frame.width
//        print(scrollView.contentOffset.x, scrollView.frame.width)
//        PageControl.currentPage = Int(page)
//    }
//    
//}
