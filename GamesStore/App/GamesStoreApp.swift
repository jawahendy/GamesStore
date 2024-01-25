//
//  GamesStoreApp.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import SwiftUI

@main
struct GamesStoreApp: App {
    let homePresenter = HomePresenter(homeUseCase: Injection.init().provideHome())
    let favPresenter = FavoritePresenter(favUseCase: Injection.init().provideFavorite())
    
    var body: some Scene {
        WindowGroup {
          ContentView()
            .environmentObject(homePresenter)
            .environmentObject(favPresenter)
        }
    }
}
