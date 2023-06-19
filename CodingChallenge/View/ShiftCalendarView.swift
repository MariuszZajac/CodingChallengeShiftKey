//
//  ShiftCalenderView.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 29/05/2023.
//

import Foundation
import SwiftUI

struct ShiftCalendarView: View {
    @ObservedObject var viewModel = ShiftCalendarViewModel()

    var body: some View {
        VStack (alignment: .leading) {
            LazyHStack(alignment: .center, spacing: 2) {
                ForEach(viewModel.daysOfWeek(), id: \.self) { date in
                    ZStack {
                        Circle()
                            .fill(viewModel.isToday(date) ? Color.green : Color.clear)
                            .frame(width: 25, height: 25)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        Text("\(viewModel.dayOfMonth(date))")
                            .foregroundColor(viewModel.isToday(date) ? .white : .black)
                            .font(.system(size: 12))
                    }
                    .padding(5)
                    .onTapGesture {
                        viewModel.selectDate(date)
                    }
                }
            }
            .frame(width: 350, height: 50)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
            if let selectedDate = viewModel.selectedDate {
                //TODO: dodać wyświetlanie dla konkretnej daty
            }

        }
    }
}
struct ShiftCalenderView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftCalendarView()
    }
}
