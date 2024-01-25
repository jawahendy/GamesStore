//
//  Homeinterac.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import Foundation
import Combine

protocol HomeUseCase {

  func getCategories() -> AnyPublisher<[CategoryGamesModel], Error>
  func addCategoriesFavorite(id: Int, fav: Bool) -> AnyPublisher<[AddfavoritModel], Error>

}

class HomeInteractor: HomeUseCase {

  private let repository: GamesRepositoryProtocol

  required init(repository: GamesRepositoryProtocol) {
    self.repository = repository
  }

    
    func getCategories() -> AnyPublisher<[CategoryGamesModel], Error> {
      return repository.getCategories()
    }
    
    func addCategoriesFavorite(id: Int, fav: Bool) -> AnyPublisher<[AddfavoritModel], Error> {
      return repository.addCategoriesFavorite(id: id, fav: fav)
    }

}
