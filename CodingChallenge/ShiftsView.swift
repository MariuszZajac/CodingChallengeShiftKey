//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView<T: Codable>: View {
 
    
    @StateObject var presenter: MyPresenter<T>
    let viewModel : ShiftsViewModel<T>
    let endpoint: Endpoint
    
    init(presenter: MyPresenter<T>, viewModel: ShiftsViewModel<T>, endpoint: Endpoint) {
         self.presenter = presenter
         self.viewModel = viewModel
         self.presenter.viewModel = viewModel
         self.endpoint = endpoint
     }
   
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                VStack {
                    ShiftCalendarView()
                    Spacer()
                        .frame(height: 20)
                    SearchView()
                }
                .padding(.top)
                
                Spacer()
                    .frame(height: 20)
                VStack {
                    if let data = viewModel.data {
                        //display data how??
                    } else {
                        ProgressView("Loading shifts...")
                        }
                    }
                .onAppear {
                      presenter.fetchData(for: endpoint)
                }
                Spacer()
            }
            }
        }
    
//    private func fetchShifts(withinDistance distance: Int, address: String, type: String) {
//        api.fetchShifts(withinDistance: distance, address: address, type: type) { shifts in
//            DispatchQueue.main.async {
//                self.shifts = shifts.sorted { $0.startTime < $1.startTime }
//                self.shifts = shifts.sorted{ $0.withinDistance < $1.withinDistance }
//            }
//        }
//    }
//
struct ShiftsView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftsView<<#T: Decodable & Encodable#>>()
    }
}
