//
//  APIError.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 04/06/2023.
//
import Foundation

public enum APIError: Error, Equatable {
    case incorrectURL(url: String)
    case noResponse
    case internetConnectionUnavailable
    case invalidResponse
    case invalidData
    case decodingError
}

