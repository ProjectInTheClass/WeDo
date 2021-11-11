//
//  LogInRequest.swift
//  WeDo
//
//  Created by 최형민 on 2021/11/09.
//

import Foundation

struct LogInRequest: Encodable {
    var password: String
    var userid: String
}
