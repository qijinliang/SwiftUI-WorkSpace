//
//  NSRootModel.swift
//  SKCodeBuilder
//
//  Created by SKGenerateModelTool on 2020/07/07.
//  Copyright © 2020 SKCodeBuilder. All rights reserved.
//

import HandyJSON
class NSRootModel : HandyJSON {

    ///
    var data: ModelData?
    /// api_base_info
    var api_base_info: Any?
    /// 0
    var login_status: Int = 0
    ///
    var last_response_extra: NSLast_response_extra?
    /// location
    var location: Any?
    /// false
    var get_offline_pool: Bool = false
    /// true
    var is_use_bytedance_stream: Bool = false
    /// 3
    var total_number: Int = 0
    /// true
    var has_more_to_refresh: Bool = false
    /// success
    var message: String?
    /// true
    var has_more: Bool = false
    ///
    var tips: NSTips?
    /// 0
    var show_et_status: Int = 0
    /// 0
    var action_to_last_stick: Int = 0
    /// false
    var show_last_read: Bool = false
    /// 0
    var feed_flag: Int = 0
    /// 分享今日新鲜事
    var post_content_hint: String?

    required init() {}
}


class NSTips : HandyJSON {

    /// app
    var type: String?
    ///
    var web_url: String?
    ///
    var open_url: String?
    /// 今日头条
    var app_name: String?
    ///
    var display_template: String?
    ///
    var download_url: String?
    /// 2
    var display_duration: Int = 0
    ///
    var display_info: String?
    ///
    var package_name: String?

    required init() {}
}


class ModelData : HandyJSON {

    ///
    var content: String?
    ///
    var code: String?

    required init() {}
}


class NSLast_response_extra : HandyJSON {

    /// e30
    var data: String?

    required init() {}
}
