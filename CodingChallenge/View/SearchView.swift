//
//  SearchView.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 02/06/2023.
//

import SwiftUI

struct SearchView: View {
    @State private var searchRadius: Int = 1
   // @State private var isSearchingExactValue = false
    var body: some View {
        HStack {
            TextField("Enter search radius", value: $searchRadius, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
            Button(action: {
                let roundedRadius = ((searchRadius + 9) / 10) * 10
              //  fetchShifts(withinDistance: roundedRadius, address: "Dallas, TX", type: "4day") //TODO: les hard coded data! 
                
                
            }) {
                Text("Search")
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
        }
        .padding(.horizontal)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
