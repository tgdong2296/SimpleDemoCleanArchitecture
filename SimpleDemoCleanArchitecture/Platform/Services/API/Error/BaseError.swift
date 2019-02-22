//
//  BaseError.swift
//  SimpleDemoCleanArchitecture
//
//  Created by trinh.giang.dong on 2/22/19.
//  Copyright © 2019 trinh.giang.dong. All rights reserved.
//

import Foundation

enum BaseError: Error {
    
    case networkError
    case httpError(httpCode: Int)
    case unexpectedError
    case apiFailure(error: ErrorResponse?)
    
    public var errorMessage: String? {
        switch self {
        case .networkError:
            return "Network Error"
            
        case .httpError(let code):
            return getHttpErrorMessage(httpCode: code)
            
        case .apiFailure(let error):
            guard let error = error else { return "Error" }
            return error.message
        
        default:
            return "Unexpected Error"
        }
    }
    
    private func getHttpErrorMessage(httpCode: Int) -> String? {
        guard let responType = HTTPStatusCode(rawValue: httpCode)?.responseType else {
            return "Unknow Error"
        }
        switch responType {
        case .informational:
            return "Informational Error"
        
        case .success:
            return "Request Success"
        
        case .redirection:
            return "It was transferred to a different URL. I'm sorry for causing you trouble"
        
        case .clientError:
            return "An error occurred on the application side. Please try again later!"
        
        case .serverError:
            return "A server error occurred. Please try again later!"
        
        case .undefined:
            return "Undefined Error"
        }
    }
}
