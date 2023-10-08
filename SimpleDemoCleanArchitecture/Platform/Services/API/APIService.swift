//
//  APIService.swift
//  SimpleDemoCleanArchitecture
//
//  Created by Giang Dong Trinh on 08/10/2023.
//  Copyright © 2023 trinh.giang.dong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Moya
import Alamofire

protocol APIServiceType {
    func request(_ target: APITarget) -> Single<Response>
}

class APIService: APIServiceType {
    
    static let shared = APIService()
    
    private let provider: MoyaProvider<APITarget>
    private let semaphore = DispatchSemaphore(value: 1)
    
    private init() {
        let configuration = URLSessionConfiguration.default.with {
            $0.headers = .default
            $0.timeoutIntervalForRequest = 30
            $0.timeoutIntervalForResource = 60
        }
        
        let session = Alamofire.Session(configuration: configuration)
        
        let networkPlugin = NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))
        
        provider = MoyaProvider(session: session, plugins: [networkPlugin])
    }
    
    // MARK: - Functions
    func request(_ target: APITarget) -> Single<Response> {
        let request = Single<Void>.just(())
            .do(onSuccess: { response in
                print("[LOG 🌏][\(target.method.rawValue)] Request \(target.baseURL.absoluteString + target.path)")
            })
            .flatMap { [unowned self] _ -> Single<Response> in
                return self.provider.rx.request(target)
            }
            .catchApiError()
        return request
    }
}

extension PrimitiveSequence where Trait == SingleTrait, Element == Response {
    
    func catchApiError() -> Single<Element> {
        let response = flatMap { response -> Single<Element> in
            switch response.statusCode {
            case 200...299:
                print("[LOG ✅] Request Success \(response.request?.url?.absoluteString ?? "")")
                return .just(response)
            default:
                print("[LOG ❌] Request Error \(response.statusCode) \(response.request?.url?.absoluteString ?? "")")
                let domain = response.request?.url?.absoluteString ?? ""
                let code = response.statusCode
                let errorMessage = HTTPURLResponse.localizedString(forStatusCode: response.statusCode)
                throw NSError(domain: domain,
                              code: code,
                              userInfo: [NSLocalizedDescriptionKey: errorMessage])
            }
        }
        return response
    }
}
