//
//  FYContentViewStyle.swift
//  FYSliderView
//
//  Created by 武飞跃 on 16/11/11.
//  Copyright © 2016年 武飞跃. All rights reserved.
//

import UIKit

//MARK: - 遮罩背景相关设置
public enum FYSliderCellMaskType {
    
    //半透明
    case translucent(backgroundColor:UIColor)
    
    /* 渐变色
     * backgroundColors : 渐变色按照数组元素的顺序显示
     * offsetY : 渐变显示的高度,表示的是从底部到顶部的距离
     */
    case gradient(backgroundColors:[UIColor],offsetY:CGFloat)
}
//MARK: - 文字标题相关设置
public enum FYTitleLabelStyle{
    case fontSize(_:CGFloat)          //文字大小
    case textColor(_:UIColor)         //文字颜色
    case textInsets(_:UIEdgeInsets)   //文字内部边距
    case labelHeight(_:CGFloat)       //标题label的高度
}

class FYContentViewStyle{

}
