//
//  FavoriteInterac.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 22/01/24.
//

import Foundation
import Combine

protocol FavorUseCase {

  func getCategoriesFavorite() -> AnyPublisher<[CategoryfavoritModel], Error>

}

class FavoritInteractor: FavorUseCase {

  private let repository: GamesRepositoryProtocol

  required init(repository: GamesRepositoryProtocol) {
    self.repository = repository
  }

    
    func getCategoriesFavorite() -> AnyPublisher<[CategoryfavoritModel], Error> {
      return repository.getCategoriesFavorite()
    }

}
