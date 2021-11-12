//
//  MemberListResponse.swift
//  WeDo
//
//  Created by 최형민 on 2021/11/12.
//

import Foundation

struct MemberListResponse {
    let code: Int64
    let data: MemberListResult?
    let msg: String
    let success: String
}

struct MemberListResult {
    let email: String
    let isMember: String
    let name: String
    let phone: String
    let profileImgUrl: String
    let statusMsg: String
    let userid: String
    let userno: Int64
}
