//
//  FavoriteDetailPresent.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 22/01/24.
//

import SwiftUI

class FavoriteDetailPresenter: ObservableObject {

  private let favdetailUseCase: FavoritDetailUseCase

  @Published var category: CategoryfavoritModel
  @Published var errorMessage: String = ""
  @Published var loadingState: Bool = false

  init(favdetailUseCase: FavoritDetailUseCase) {
    self.favdetailUseCase = favdetailUseCase
      category = favdetailUseCase.getFavCategory()
  }

}
