//
//  FiveViewController.swift
//  FYSliderView
//
//  Created by 武飞跃 on 16/10/10.
//  Copyright © 2016年 武飞跃. All rights reserved.
//

import UIKit

class FiveViewController: UIViewController,FYSliderViewCustomizable {
    
    
    var sliderView:FYSliderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        
        setupSliderView()
    }
    
    func initData(){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            let imageObj1 = FYImageObject(url:"http://www.wufeiyue.com/wp-content/uploads/2016/10/pic0.jpg" ,title:"“十一”旅游“红黑榜”发布")
            
            let imageObj2 = FYImageObject(url:"http://www.wufeiyue.com/wp-content/uploads/2016/10/pic1.jpg" ,title:"国庆黄金周出境游是去年的两倍")
            
            let imageObj3 = FYImageObject(url:"http://www.wufeiyue.com/wp-content/uploads/2016/10/pic2.jpg" ,title:"韶山获评为全国旅游“综合秩序最佳景区”")
            
            let imageObj4 = FYImageObject(url:"http://www.wufeiyue.com/wp-content/uploads/2016/10/pic5.jpg" ,title:"国庆黄金周合肥接待游客1287万 ")
            
            dispatch_async(dispatch_get_main_queue(), {
                self.sliderView.imageObjectGroup = [imageObj1,imageObj2,imageObj3,imageObj4]
            })
        })

    }
    
    func setupSliderView(){
        
        sliderView = FYSliderView(frame: CGRect(x: 0, y: 64, width: view.bounds.size.width, height: 200),option:self)
        view.addSubview(sliderView)
        
    }
    //MARK: - FYSliderView配置信息
    var maskType: FYSliderCellMaskType{
        return .translucent(backgroundColor:UIColor(red: 0, green: 0, blue: 0, alpha: 0.5))
    }
    var controlType: FYPageControlType{
        return .custom(currentColor:UIColor(red: 1, green: 1, blue: 1, alpha: 1) , normalColor:UIColor(red: 1, green: 1, blue: 1, alpha: 0.8),layout:[.point(x:.right(10), y:.bottom(13))])
    }
    
    deinit{
        print("FiveViewController")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}