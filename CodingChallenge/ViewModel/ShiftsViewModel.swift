//
//  MyViewModel.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 16/06/2023.
//

import Foundation
import Combine

class ShiftsVieWModel: ObservableObject {
    @Published var dataShifts = [ShiftData]()
    private var cancellables: [AnyCancellable] = []
    
    @Published var state: State = .loading
    enum State {
        case loading, error(Error), loaded
    }

    
    func fetchShifts() {
        
        let apiClient = DefaultAPIClient(session: URLSession.shared)
        apiClient.perform(request: ShiftRequest(distance: 10, address: "Dallas, TX", type: "4day"))
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    self?.state = .loaded
                case .failure(let error):
                    self?.state = .error(error)
                }
                
            }, receiveValue: { [ weak self] data in
                self?.dataShifts = data.data
            })
            .store(in: &cancellables)
                
         }
}

