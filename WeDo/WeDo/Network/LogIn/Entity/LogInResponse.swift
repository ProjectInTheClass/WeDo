//
//  LogInResponse.swift
//  WeDo
//
//  Created by 최형민 on 2021/11/09.
//

import Foundation

struct LogInResponse: Codable {
    let code: Int
    let data: LogInResult?
    let msg: String
    let success: Bool
}

struct LogInResult: Codable {
    let authToken: String
    let email: String
    let mod_date: Date
    let name: String
    let password: String
    let phone: String
    let profileImgUrl: String
    let reg_date: Date
    let statusMsg: String
    let userid: String
    let userno: Int
}
