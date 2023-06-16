//
//  CodingChallengeApp.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

@main
struct CodingChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            let presenter = MyPresenter<ShiftData>(apiClient: APIClient(), viewModel: ShiftsViewModel<ShiftData>())
                        ShiftsView(presenter: presenter, viewModel: presenter.viewModel, endpoint: Endpoint())        }
    }
}

