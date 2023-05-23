//
//  Shift.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 23/05/2023.
//

import SwiftUI

class ShiftsViewModel: ObservableObject {
    @Published var shifts: [Shift] = []
    
    func fetchShifts() {
            let url = URL(string: "https://staging-app.shiftkey.com/api/v2/available_shifts")!
            
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.queryItems = [
                URLQueryItem(name: "type", value: "week"),
                URLQueryItem(name: "start", value: "2023-05-21"),
                URLQueryItem(name: "end", value: "2023-05-28"),
                URLQueryItem(name: "address", value: "Dallas, TX"),
                URLQueryItem(name: "radius", value: "150")
            ]
            
            guard let finalURL = components?.url else {
                return
            }
            
            var request = URLRequest(url: finalURL)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
                guard let data = data else {
                    return
                }
                
                let decoder = JSONDecoder()
                do {
                    let shifts = try decoder.decode([Shift].self, from: data)
                    DispatchQueue.main.async {
                        self?.shifts = shifts
                    }
                } catch {
                    print("Error decoding shifts: \(error)")
                }
            }
            
            task.resume()
        }
    }
