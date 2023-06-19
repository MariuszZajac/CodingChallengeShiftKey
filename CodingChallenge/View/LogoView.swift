//
//  LogoView.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 02/06/2023.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .foregroundColor(.green)
                    .frame(width: 50, height: 50)
                Text("S")
                    .font(.system(size: 39, weight: .bold))
                    .foregroundColor(.white)
            }
            Text("Shiftit")
                .font(.title)
                .foregroundColor(.black)
        }
        
    }
}




struct ContentView: View {
    var body: some View {
        LogoView()
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
