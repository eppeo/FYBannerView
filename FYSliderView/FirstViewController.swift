//
//  FirstViewController.swift
//  FYSliderView
//
//  Created by 武飞跃 on 16/10/10.
//  Copyright © 2016年 武飞跃. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,FYSliderViewCustomizable {

    var dataSource:[FYImageObject]!
    var sliderView:FYSliderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        
        setupSliderView()
    }
    
    func initData(){
        let imageObj1 = FYImageObject(url:"http://www.wufeiyue.com/wp-content/uploads/2016/10/pic0.jpg" ,title:"")
        
        let imageObj2 = FYImageObject(url:"http://www.wufeiyue.com/wp-content/uploads/2016/10/pic1.jpg" ,title:"")
        
        let imageObj3 = FYImageObject(url:"http://www.wufeiyue.com/wp-content/uploads/2016/10/pic2.jpg" ,title:"")
        
        let imageObj4 = FYImageObject(url:"http://www.wufeiyue.com/wp-content/uploads/2016/10/pic5.jpg" ,title:"")
        
        dataSource = [imageObj1,imageObj2,imageObj3,imageObj4] //
    }
    
    func setupSliderView(){
        automaticallyAdjustsScrollViewInsets = false
        sliderView = FYSliderView(frame: CGRect(x: 0, y: 64, width: view.bounds.size.width, height: 200),option:self)
        view.addSubview(sliderView)
        sliderView.imageObjectGroup = dataSource
    }
    //MARK: - FYSliderView配置信息
    var controlType: FYPageControlType{
        return .custom(currentColor:UIColor(red: 1, green: 1, blue: 1, alpha: 1) , normalColor:UIColor(red: 1, green: 1, blue: 1, alpha: 0.8),layout:[.size(borderWidth: 3,circleWidth: 20),.point(x:.right(10), y:.top(20))])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


