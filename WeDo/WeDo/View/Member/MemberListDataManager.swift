//
//  MemberListDataManager.swift
//  WeDo
//
//  Created by 최형민 on 2021/11/12.
//

import Foundation
import Alamofire

class MemberListDataManager {
    
    func getMemberList(delegate: MemberViewController) {
    
    
        let URL = "http://115.85.183.225:7989/v1/api/user/member"
    
        AF.request(URL, method: .get, encoding: JSONEncoding.default, headers: [ "Content-Type":"application/json"])
                .responseDecodable(of: MemberListResponse.self) { response in
                    switch response.result {
                    case .success(let response):
                        delegate.didSuccessMemberLIst(result: response.result)
                    case .failure(let error):
                        delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                    }
                }
    }
}

