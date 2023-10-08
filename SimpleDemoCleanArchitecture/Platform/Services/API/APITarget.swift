//
//  APITarget.swift
//  SimpleDemoCleanArchitecture
//
//  Created by Giang Dong Trinh on 08/10/2023.
//  Copyright © 2023 trinh.giang.dong. All rights reserved.
//

import Foundation
import Moya

enum APITarget {
    case repositories(request: GithubRepoRequest)
}

extension APITarget: TargetType {
    
    var baseURL: URL {
        let domain = URLs.API.baseUrl
        guard let url = URL(string: domain) else {
            fatalError("Invalid base URL.")
        }
        return url
    }
    
    var headers: [String : String]? {
        switch self {
        case .repositories:
            return [
                "Content-type": "application/json",
                "Accept": "application/json"
            ]
        }
    }
    
    var path: String {
        switch self {
        case .repositories:
            return "/search/repositories"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .repositories:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .repositories(let request):
            let parameters: [String: Any] = [
                "q": request.language,
                "per_page": request.perPage,
                "page": request.page
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var sampleData: Data {
        // Bundle.main.loadData(fileName: "") ?? Data()
        return Data()
    }
}

extension String {
    /// Throw crash error if API did not define in documentation.
    static var throwDocumentError: String {
        fatalError("API document did not define!")
    }
}

extension Moya.Method {
    /// Throw crash error if API did not define in documentation.
    static var throwDocumentError: Moya.Method {
        fatalError("API document did not define!")
    }
}

extension Task {
    /// Throw crash error if API did not define in documentation.
    static var throwDocumentError: Task {
        fatalError("API document did not define!")
    }
}

