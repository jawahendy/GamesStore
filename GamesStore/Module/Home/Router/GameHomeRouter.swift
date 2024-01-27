//
//  GameHomeRouter.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import SwiftUI
import Core
import Category


class HomeRouter {

  func makeDetailView(for category: CategoryGamesModels) -> some View {
      
      let categoryUseCase: Interactor<
        Any,
        [CategoryGamesModels],
        [AddfavoritModels],
        GetCategoriesRepository<
          GetCategoriesRemoteDataSource,
          CategoryTransformer>
      > = Injection.init().provideCategory()

    let presenter = GetListPresenter(useCase: categoryUseCase)

    return DetailView(presenter: presenter, category: category)
  }

}
