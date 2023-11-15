//
//  CommentService.swift
//  HighSchoolFish_MVVM
//
//  Created by 강보현 on 11/11/23.
//

import Foundation
import Moya

enum CommentService {
    case readComment(boardId: String, page: Int, size: Int)
}

extension CommentService: TargetType {
    var baseURL: URL {
        return URL(string:  "http://high-school-fish.com:8080")!
    }
    
    var path: String {
        switch self {
        case .readComment(let boardId, _, _):
            return "/api/v1/schools/boards/\(boardId)/comments"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .readComment(_):
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .readComment:
            return "@@".data(using: .utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .readComment(_, let page, let size):
            let params: [String: Any] = [
                "page": page,
                "size": size
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .readComment:
            return ["Content-Type": "application/json"]
        }
    }
    
    
}
