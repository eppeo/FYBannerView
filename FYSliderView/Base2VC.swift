//
//  Base2VC.swift
//  FYSliderView
//
//  Created by 武飞跃 on 16/10/11.
//  Copyright © 2016年 武飞跃. All rights reserved.
//

import UIKit

class Base2VC: UIViewController {
    
    var showLabel:UILabel!
    var textString:String!{
        willSet{
            showLabel.text = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    ///获取数据
    func getData(completion:(data:NSData)->Void){
        let url = NSURL(string: "http://7xt77b.com1.z0.glb.clouddn.com/fysliderview_text.json")
        let request = NSURLRequest.init(URL: url!)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            
            dispatch_async(dispatch_get_main_queue(), {
                completion(data: data!)
            })
        }
        task.resume()
        
    }
    
    //显示当前页面的索引label -->查看 SevenViewController
    func setupShowLabel(){
        showLabel = UILabel()
        showLabel.frame.size = CGSize(width: 100, height: 40)
        showLabel.center = view.center
        showLabel.textColor = UIColor.whiteColor()
        showLabel.backgroundColor = UIColor.grayColor()
        showLabel.font = UIFont.systemFontOfSize(18)
        showLabel.textAlignment = .Center
        showLabel.text = "显示值"
        view.addSubview(showLabel)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

