//
//  NightViewController.swift
//  FYSliderView
//
//  Created by 武飞跃 on 16/11/11.
//  Copyright © 2016年 武飞跃. All rights reserved.
//

import UIKit

class NightViewController: Base1VC,FYSliderViewCustomizable {

    var dataSource:[FYImageObject]!
    var sliderView:FYSliderView!
    var contentObjectFlag:Int = 0 {
        didSet{
            
            if contentObjectFlag >= oldValue{
                print("增加\n")
                let contentObject = dataSource[contentObjectFlag - 1]
                sliderView.imageObjectGroup.append(contentObject)
                
                
            }else if oldValue > contentObjectFlag{
                print("减少\n")
                sliderView.imageObjectGroup.removeLast()
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        createView()
    }
    
    func initData(){
        //获取网络数据
        getData { (data) in
            let dic = try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
            let dataSource = dic["data"] as! [[String:String]]
            
            //拿到网络数据存到dataSource中
            self.dataSource = dataSource.map({ dic in
                return FYImageObject(url: dic["banner_picture_url"], title: dic["banner_title"])
            })
        }
    }
    
    func createView(){
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: "+", style: .Plain, target: self, action: #selector(self.addImageTapped)),
            UIBarButtonItem(title: "-", style: .Plain, target: self, action: #selector(self.delegateImageTapped))]
        showLabel.text = "点击右上角"
        view.addSubview(showLabel)
        
        //初始化轮播图
        sliderView = FYSliderView(frame: CGRect(x: 0, y: 64, width: view.bounds.size.width, height: 200),option:self)
        view.addSubview(sliderView)
        
        sliderView.imageObjectGroup = [FYImageObject]()
    }
    
    func addImageTapped(){
        
        if contentObjectFlag < dataSource.count {
            contentObjectFlag += 1
        }
    }
    
    func delegateImageTapped(){
        
        if contentObjectFlag > 0 {
            contentObjectFlag -= 1
        }
    }
    
    deinit{
        print("NightViewController")
    }
    

    var hidesForSinglePage: Bool{
        return false
    }
    
}
