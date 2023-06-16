//
//  MyPresenter.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 16/06/2023.
//

import Foundation
class MyPresenter<T: Codable>: ObservableObject {
    @Published var viewModel: ShiftsViewModel<T>
    let apiClient: APIClient
    
    init(apiClient: APIClient, viewModel: ShiftsViewModel<T>) {
        self.apiClient = apiClient
        self.viewModel = viewModel
    }
    
    func fetchData(for endpoint: Endpoint) {
        apiClient.fetch(endpoint: endpoint) { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.viewModel.data = data
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
