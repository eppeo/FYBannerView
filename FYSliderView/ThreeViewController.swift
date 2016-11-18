//
//  ThreeViewController.swift
//  FYSliderView
//
//  Created by 武飞跃 on 16/10/10.
//  Copyright © 2016年 武飞跃. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController,FYSliderViewCustomizable {
    
    
    var sliderView:FYSliderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        
        setupSliderView()
    }
    
    func initData(){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            let imageObj1 = FYImageObject(url:"http://www.wufeiyue.com/wp-content/uploads/2016/10/pic0.jpg" ,title:"")
            
            let imageObj2 = FYImageObject(url:"http://www.wufeiyue.com/wp-content/uploads/2016/10/pic1.jpg" ,title:"")
            
            let imageObj3 = FYImageObject(url:"http://www.wufeiyue.com/wp-content/uploads/2016/10/pic2.jpg" ,title:nil)
            
            let imageObj4 = FYImageObject(url:"http://www.wufeiyue.com/wp-content/uploads/2016/10/pic5.jpg" ,title:"")
            
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
    var controlType: FYPageControlType{
        return .system(currentColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1) , normalColor:UIColor(red: 1, green: 1, blue: 1, alpha: 0.8),point:(x:.left(100), y:.bottom(10)))
    }
    
    deinit{
        print("ThreeViewController")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}