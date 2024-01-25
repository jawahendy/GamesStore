//
//  GameHomeRouter.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import SwiftUI

class HomeRouter {

    func makeDetailView(for category: CategoryGamesModel) -> some View {
      let detailUseCase = Injection.init().provideDetail(category: category)
    let presenter = DetailPresenter(detailUseCase: detailUseCase)
    return DetailView(presenter: presenter)
  }

}
