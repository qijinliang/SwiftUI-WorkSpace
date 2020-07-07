//
//  Common.swift
//  Swift-NetWorking
//
//  Created by qjinliang on 2020/7/7.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import UIKit

// callback
typealias DictionaryCallback = (_ value: [String:Any]) -> Void
typealias ObjectCallback = (_ value: Any) -> Void

//屏幕的高
let screenHeight:CGFloat = UIScreen.main.bounds.height
let screenWidth:CGFloat = UIScreen.main.bounds.width

let kSectionHeight: CGFloat = 24
let kSectionHeightZero: CGFloat = 0.01
//适配iPhoneX
let navHeight:CGFloat = DeviceInfo.isiPhoneXOrLater() ? 24 : 0
let tabHeight:CGFloat = DeviceInfo.isiPhoneXOrLater() ? 34 : 0

let kThemeColor = UIColor(red: 249/255, green: 191/255, blue: 0/255, alpha: 1.0)
let kBlackColor = UIColor(red: 57/255, green: 57/255, blue: 58/255, alpha: 1.0)
let kBackgroundColor = UIColor.hexStringToColor(stringToConvert: "#F7F8FC")
let kLineColor = UIColor.hexStringToColor(stringToConvert: "#E5E7ED")

//MARK:- font (不用动态字体)
let kFont30 = UIFont.systemFont(ofSize: 30)
let kFont20 = UIFont.systemFont(ofSize: 20)
let kFont17  = UIFont.systemFont(ofSize: 17)
let kFont16  = UIFont.systemFont(ofSize: 16)
let kFont15  = UIFont.systemFont(ofSize: 15)
let kFont14  = UIFont.systemFont(ofSize: 14)
let kFont13  = UIFont.systemFont(ofSize: 13)
let kFont12  = UIFont.systemFont(ofSize: 12)
let kFont11  = UIFont.systemFont(ofSize: 11)
let kFont10  = UIFont.systemFont(ofSize: 10)

//MARK:-判断字符串是否存在
func stringIsEmpty(_ string: String?)->Bool{
    if string==nil || string == "" {
        return true
    }else {
        return false
    }
}

//MARK:-计算字体大小
func calculateTextSize(text: String, font: UIFont) -> CGSize {
    let str = NSString(string: text)
    let size = str.size(withAttributes: [NSAttributedString.Key.font: font])
    return size
}

//MARK:-延迟执行
func delay(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

func getStoryboardInstantiateViewController(identifier: String) -> UIViewController? {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    return sb.instantiateViewController(withIdentifier: identifier)
}

func timeIntervalToMMSSFormat(interval: Float64) -> String {
    let ti = Int64(interval)
    let seconds: Int64 = ti%60
    let minutes: Int64 = (ti/60)%60
    return String(format: "%02ld:%02ld", arguments: [minutes, seconds])
}

func intersectSorted<T: NSObject>(_ nums1: [T], _ nums2: [T]) -> [T] {
    var intersects = [T]()
    var i = 0
    var j = 0
    var k = 0
    while i < nums1.count {
        while j < nums2.count && i < nums1.count {
            if nums1[i] == nums2[j] {
                intersects.append(nums1[i])
                i += 1
                j += 1
                k = j
            }
            j += 1
        }
        i += 1
        j = k
    }
    return intersects
}


