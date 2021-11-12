//
//  LogInDataManager.swift
//  WeDo
//
//  Created by 최형민 on 2021/11/09.
//

import Foundation
import Alamofire

struct LogInDataManager {
    static let shared = LogInDataManager()
    
    let URL = "http://115.85.183.225:7989/v1/api/user/login"
    
    func postLogIn(_ parameters: LogInRequest, delegate: LoginViewController) {
            AF.request(URL, method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: [ "Content-Type":"application/json"])
                .responseDecodable(of: LogInResponse.self) { response in
                    switch response.result {
                    case .success(let response):
                        // 성공했을 때
                        if response.success, let result = response.data {
                            delegate.didSuccessSignIn(result)
                        }
                        // 실패했을 때
                        else {
                            switch response.code {
                            default: delegate.failedToRequest(message: "제발 성공...!")
                            }
                        }
                    case .failure(let error):
                        print("에러발생",error.localizedDescription)
                        delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
        }
}
