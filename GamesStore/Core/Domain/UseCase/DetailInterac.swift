//
//  DetailInterac.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import Foundation

protocol DetailUseCase {

  func getCategory() -> CategoryGamesModel

}

class DetailInteractor: DetailUseCase {

  private let repository: GamesRepositoryProtocol
  private let category: CategoryGamesModel

  required init(
    repository: GamesRepositoryProtocol,
    category: CategoryGamesModel
  ) {
    self.repository = repository
    self.category = category
  }

  func getCategory() -> CategoryGamesModel {
    return category
  }
    
}
