//
//  MyViewModel.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 16/06/2023.
//

import Foundation
import Combine

class ShiftsViewModel: ObservableObject {
    @Published var dataShifts = [ShiftData]()
    private var cancellables: [AnyCancellable] = []
    
    @Published var state: State = .loading
    enum State {
        case loading, error(Error), loaded
    }
    
    
    public func fetchShifts(distance: Int, address: String, type: String) {
        let apiClient = DefaultAPIClient(session: URLSession.shared)
        let shiftRequest = ShiftRequest(distance: distance, address: address, type: type)
        apiClient.perform(request: shiftRequest)
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    self?.state = .loaded
                case .failure(let error):
                    self?.state = .error(error)
                }
            }, receiveValue: { [weak self] responseData in
                self?.dataShifts = responseData.data
            })
            .store(in: &cancellables)
    }
    
}


