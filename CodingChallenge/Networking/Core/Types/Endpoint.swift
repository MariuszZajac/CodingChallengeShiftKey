//
//  Endpoint.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 16/06/2023.
//

import Foundation

protocol Endpoint {
    
    var path: String { get }
    var httpMethod: HTTPMethod { get}
//    var parameters: [String: Any] { get }
//    var headers: [String: String] { get }
 ///Make sure that the parameters are correct.!!!!
 func request(with baseURL: URL) -> URLRequest?
}


enum ShiftEndpoint {
    case getShift
}
extension ShiftEndpoint: Endpoint{
  
    
    var path: String {
        switch self {
        case .getShift:
            return "/available_shifts" //TODO: Shifts
        }
    }
    var httpMethod: HTTPMethod  {
        return .get
    }
    func request(with baseURL: URL) -> URLRequest? {
        
        guard let url = URL(string: baseURL.absoluteString + path) else {
                   return nil
               }
        var request = URLRequest(url: url)
                request.httpMethod = httpMethod.rawValue
                
                // Add parameters and headers if needed
                
                return request
    }
}
