//
//  SearchView.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 02/06/2023.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel

    var body: some View {
        HStack {
            TextField("Enter search radius", value: $viewModel.searchRadius, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)

            Button(action: {
               // viewModel.search() //TODO: Enter search radius
            }) {
                Text("Search")
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .frame(width: 90, height: 10)
            }
        }
        .padding(.horizontal)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SearchViewModel(shiftsViewModel: ShiftsViewModel())
        SearchView(viewModel: viewModel)
    }
}
