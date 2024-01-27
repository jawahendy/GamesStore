//
//  GamesStoreApp.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import SwiftUI
import Core
import Category
import Favorite

let categoryUseCase: Interactor<
  Any,
  [CategoryGamesModels],
  [AddfavoritModels],
  GetCategoriesRepository<
    GetCategoriesRemoteDataSource,
    CategoryTransformer>
> = Injection.init().provideCategory()

let categoryFavUseCase: InteractorFavorite<
  Any,
  [CategoryfavoritsModels],
  GetCategoriesFavorRepository<
    GetCategoriesFavRemoteDataSource,
    CategoryTransformerFavorite>
> = Injection.init().provideCategoryFavorite()


@main
struct GamesStoreApp: App {
    let homePresenter = GetListPresenter(useCase: categoryUseCase)
    let favPresenter = GetListFavoritePresenter(useCase: categoryFavUseCase)
    
    var body: some Scene {
        WindowGroup {
          ContentView()
            .environmentObject(homePresenter)
            .environmentObject(favPresenter)
        }
    }
}
