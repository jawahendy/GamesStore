//
//  Profile.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import SwiftUI


struct profile : View {
    var body: some View {
        VStack {
            Image("me").renderingMode(.original).resizable().scaledToFill().frame(width: 200, height: 200).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).padding(.bottom, 50)
            Text("Hendy Nurfrianto").font(.system(size: 30, weight: .bold, design: .serif))
            Text("Developer").font(.system(size: 15, weight: .light, design: .serif)).padding(.all, 20).multilineTextAlignment(.center)
        }
    }
}

#Preview {
    profile()
}

