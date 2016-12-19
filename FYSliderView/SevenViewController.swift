//
//  SevenViewController.swift
//  FYSliderView
//
//  Created by 武飞跃 on 16/10/10.
//  Copyright © 2016年 武飞跃. All rights reserved.
//

import UIKit

class SevenViewController: Base2VC,FYSliderViewCustomizable {
        
    
    var sliderView:FYSliderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取网络数据
        getData { (data) in
            let dic = try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
            let dataSource = dic["data"] as! [[String:String]]
            
            self.sliderView.imageObjectGroup = dataSource.map({ dic in
                return FYImageObject(url: dic["banner_picture_url"], title: dic["banner_title"])
            })
        }
        
        
        //初始化轮播图
        sliderView = FYSliderView(frame: CGRect(x: 0, y: 64, width: view.bounds.size.width, height: 200),option:self)
        sliderView.delegate = self
        view.addSubview(sliderView)
        
        //显示索引的label
        view.addSubview(showLabel)

    }

    //MARK: - FYSliderView配置信息
    var controlType: FYPageControlType{
        return .custom(currentColor:UIColor(red: 1, green: 1, blue: 1, alpha: 1) ,
                       normalColor:UIColor(red: 1, green: 1, blue: 1, alpha: 0.8),
                       layout:[.point(x:.right(10), y:.bottom(16))],animationType:.zoom)
    }
    
    deinit{
        print("SevenViewController")
    }
    
}

extension SevenViewController:FYSliderViewDelegate{
    func sliderView(didScrollToIndex index: Int) {
        textString = "滚到了\(index)"
    }
    
    func sliderView(didSelectItemAtIndex index: Int) {
        textString = "点击了\(index)"
    }
}