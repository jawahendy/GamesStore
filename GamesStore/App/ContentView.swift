//
//  ContentView.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var homePresenter: HomePresenter
    @EnvironmentObject var favPresenter: FavoritePresenter
    
    var body: some View {
        NavigationStack {
            TabView {
                HomeView(presenter: homePresenter)
                    .tabItem {
                        Label("Games", systemImage: "list.dash")
                    }
                FavoriteView(presenter: favPresenter)
                    .tabItem {
                        Label("Favorite", systemImage: "heart.fill")
                    }
                profile()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
            }.accentColor(.red)
        }
    }
}
