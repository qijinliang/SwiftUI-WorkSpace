//
//  HomeController.swift
//  Swift-Networking
//
//  Created by qjinliang on 2020/7/7.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import HandyJSON


class HomeController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = "https://api3-normal-c-lq.snssdk.com/api/news/feed/v64/?version_code=7.7.7&tma_jssdk_version=1.68.0.55&app_name=news_article&vid=2F575E57-EAE2-434B-91F4-FF75933835D5&device_id=69570315712&channel=App%20Store&resolution=828*1792&aid=13&ab_feature=794526,1662483,1538698,1650563,1730955&ab_version=660830,1742771,662176,1832760,1417597,1843682,662099,1835135,1634983,668774,1812121,1827720,668775,1809700,1789133,1484965,1529253,1157750,1419048,1828056,1190525,1739749,1419597,1789126,1469498,1593455,668779,1770152,1811288&ab_group=794526,1662483,1538698,1650563,1730955&openudid=659cbb3b5e208c2d661b6f56679c08980232a9d7&pos=5pe9vb/88Pzt3vTp5L+9p72/eyoseAEueCUfv7GXvb2//vTp5L+9p72/eyoseAEueCUfv7GXvb2/8fLz+vTp6Pn4v72nvaysrrOkqaqprqytpKWtpK2vpbGXvb2/8fzp9Ono+fi/vae9r6+zqKmrraqrrqWlpaWlpaWlsZe9vb/88Pzt0fzp9Ono+fi/vae9r6+zqKmrraqrrqWlpaWlpaWlsZe9vb/88Pzt0fLz+vTp6Pn4v72nvaysrrOkqaqprqytpKWtpK2vpbGXvb2/8fL+/PHC8fzp+O7pwu3y7r+9p73ml729vb2/6fTw+O7p/PDtv72nvayopKmsra+prK2zq6StpKyvsZe9vb29v+3v8uv08/74v72nvb94JCJ5JQF6ARy/sZe9vb29v/706eS/vae9v3sqLHgBLnglH7+xl729vb2//vLy7/n08/zp+Mv88ej47r+9p73ml729vb29vb/x8vP69Ono+fi/vae9rKyus6SpqqmurK2kpa2kra+lsZe9vb29vb2/8fzp9Ono+fi/vae9r6+zqKmrraqrrqWlpaWlpaWll729vb3gsZe9vb29v/z5+e/47u6/vae9v3gkInklAXoBHHsqLHgBLnglH3gQCngsLHgRJ3ovOXsoKnU8CnQcDno6DHsEJ3klAXUqMqx4Eip1MzJ6IxN6Ogx7Fx14JCJ4ASe/l7294Jfg&cdid=5D4C427B-225F-4203-BFAF-07CF1C5B4141&update_version_code=77734&idfv=2F575E57-EAE2-434B-91F4-FF75933835D5&ac=WIFI&os_version=13.4.1&ssmix=a&device_platform=iphone&iid=3465248672586431&ab_client=a1,f2,f7,e1&device_type=iPhone12,1&idfa=1C464AE3-1768-475D-8BC8-CB7B3DA4B560&detail=1&category=video&last_refresh_sub_entrance_interval=4&list_entrance=main_tab&tt_from=pull&count=20&loc_mode=1&LBS_status=authroize&client_extra_params=%7B%22last_ad_position%22%3A-1%2C%22playparam%22%3A%22codec_type%3A1%22%7D&cp=57F90348162BBq1&min_behot_time=1594102453&image=1&strict=0&language=zh-Hans-CN&refer=1&ad_ui_style=%7B%22van_package%22%3A130000040%2C%22is_crowd_generalization_style%22%3Atrue%7D"
        Alamofire.request(url, parameters: nil).responseJSON { (response) in
            
            guard response.result.isSuccess else {
                return
            }
            
            if let value = response.result.value {
                let json = JSON(value)
                print("\(json)")
                if let jsonDict = json.dictionaryObject {
                    let nsrootmodel = NSRootModel.deserialize(from: jsonDict)
                    
                    if let datas = (jsonDict["data"] as AnyObject).arrayObject {
                        
                    }
                    print("\(String(describing: nsrootmodel?.data))")
                    print("\(String(describing: nsrootmodel?.tips?.display_info))")
                }
            }
        }
    }
}

