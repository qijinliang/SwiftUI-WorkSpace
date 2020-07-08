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


/// 获取当前 秒级 时间戳 - 10位
func getTimeStamp() -> String {
    //获取当前时间
    let now = NSDate()
    //当前时间的时间戳
    let timeInterval : TimeInterval = now.timeIntervalSince1970
    let timeStamp = Int(timeInterval)
    return "\(timeStamp)"
}

func getMilliStamp() -> String {
    //获取当前时间
    let now = NSDate()
    //当前时间的时间戳
    let timeInterval : TimeInterval = now.timeIntervalSince1970
    let millisecond = CLongLong(round(timeInterval*1000))
    return "\(millisecond)"
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


