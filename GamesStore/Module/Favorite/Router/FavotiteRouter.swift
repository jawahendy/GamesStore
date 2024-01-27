//
//  FavotiteRouter.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 22/01/24.
//

import SwiftUI
import Core
import Favorite

class FavotiteRouter {

  func makeDetailView(for categoryfavorite: CategoryfavoritsModels) -> some View {
      
      let categoryFavUseCase: InteractorFavorite<
        Any,
        [CategoryfavoritsModels],
        GetCategoriesFavorRepository<
          GetCategoriesFavRemoteDataSource,
          CategoryTransformerFavorite>
      > = Injection.init().provideCategoryFavorite()
      
      let presenter = GetListFavoritePresenter(useCase: categoryFavUseCase)
      return FavorDetailView(presenter: presenter, category: categoryfavorite)
      
  }

}
