//
//  NewsJsonError.swift
//  NewsApI
//
//  Created by krutika on 2/16/21.
//

import Foundation

enum NewsJsonError : Equatable , LocalizedError{
    case invalidUrl
    case invalidResponse
    case failed(description : String)
    var errorDescription: String? {
        switch self {
        case .failed(let description):
            return description
        case .invalidUrl , .invalidResponse:
            return ""
        }
    }
    
}
