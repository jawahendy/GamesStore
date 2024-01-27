//
//  ContentView.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import SwiftUI
import Core
import Category
import Favorite

struct ContentView: View {
    @EnvironmentObject var homePresenter: GetListPresenter<Any, CategoryGamesModels, AddfavoritModels, Interactor<Any, [CategoryGamesModels], [AddfavoritModels], GetCategoriesRepository<GetCategoriesRemoteDataSource, CategoryTransformer>>>
    @EnvironmentObject var favPresenter: GetListFavoritePresenter<Any, CategoryfavoritsModels, InteractorFavorite<Any, [CategoryfavoritsModels], GetCategoriesFavorRepository<GetCategoriesFavRemoteDataSource, CategoryTransformerFavorite>>>
    
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
