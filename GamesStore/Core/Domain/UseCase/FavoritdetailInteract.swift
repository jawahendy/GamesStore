//
//  FavoritdetailInteract.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 22/01/24.
//

import Foundation

protocol FavoritDetailUseCase {

  func getFavCategory() -> CategoryfavoritModel

}

class FavoritDetailInteractor: FavoritDetailUseCase {

  private let repository: GamesRepositoryProtocol
  private let category: CategoryfavoritModel

  required init(
    repository: GamesRepositoryProtocol,
    category: CategoryfavoritModel
  ) {
    self.repository = repository
    self.category = category
  }

  func getFavCategory() -> CategoryfavoritModel {
    return category
  }

}
