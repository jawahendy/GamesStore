//
//  FavotiteRouter.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 22/01/24.
//

import SwiftUI

class FavotiteRouter {

  func makeDetailView(for categoryfavorite: CategoryfavoritModel) -> some View {
    let detailUseCase = Injection.init().provideDetailFavorite(categoryFav: categoryfavorite)
      let presenter = FavoriteDetailPresenter(favdetailUseCase: detailUseCase)
    return FavorDetailView(presenter: presenter)
  }

}
