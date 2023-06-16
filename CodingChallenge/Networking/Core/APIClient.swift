//
//  APIClient.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 16/06/2023.
//
import Combine
import Foundation

protocol APIClient {
    var baseURL: URL { get }
    var session: URLSession { get }
    
    func fetch<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void)
}

