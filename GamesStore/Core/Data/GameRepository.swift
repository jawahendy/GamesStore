//
//  GameRepository.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import Foundation
import Combine


protocol GamesRepositoryProtocol {

  func getCategories() -> AnyPublisher<[CategoryGamesModel], Error>
  func getCategoriesFavorite() -> AnyPublisher<[CategoryfavoritModel], Error>
  func addCategoriesFavorite(id: Int, fav: Bool) -> AnyPublisher<[AddfavoritModel], Error>

}

final class GamesRepository: NSObject {

  typealias GamesInstance = (RemoteDataSource) -> GamesRepository

  fileprivate let remote: RemoteDataSource

  private init(remote: RemoteDataSource) {
    self.remote = remote
  }

  static let sharedInstance: GamesInstance = { remoteRepo in
    return GamesRepository(remote: remoteRepo)
  }

}

extension GamesRepository: GamesRepositoryProtocol {

  func getCategories() -> AnyPublisher<[CategoryGamesModel], Error> {
    return self.remote.getCategories()
      .flatMap { result -> AnyPublisher<[CategoryGamesModel], Error> in
        if result.isEmpty {
          return self.remote.getCategories()
            .map { GamesMapper.mapCategoryResponsesToDomains(input: $0) }
            .flatMap { _ in self.remote.getCategories()
              .map { GamesMapper.mapCategoryResponsesToDomains(input: $0) }
            }
            .eraseToAnyPublisher()
        } else {
          return self.remote.getCategories()
            .map { GamesMapper.mapCategoryResponsesToDomains(input: $0) }
            .eraseToAnyPublisher()
        }
      }.eraseToAnyPublisher()
  }
    
    func getCategoriesFavorite() -> AnyPublisher<[CategoryfavoritModel], Error> {
      return self.remote.getCategories()
        .flatMap { result -> AnyPublisher<[CategoryfavoritModel], Error> in
          if result.isEmpty {
            return self.remote.getCategoriesFavorite()
              .map { GamesMapper.mapCategoryResponsesToDomainsFavorit(input: $0) }
              .flatMap { _ in self.remote.getCategoriesFavorite()
                .map { GamesMapper.mapCategoryResponsesToDomainsFavorit(input: $0) }
              }
              .eraseToAnyPublisher()
          } else {
            return self.remote.getCategoriesFavorite()
              .map { GamesMapper.mapCategoryResponsesToDomainsFavorit(input: $0) }
              .eraseToAnyPublisher()
          }
        }.eraseToAnyPublisher()
    }
    
    func addCategoriesFavorite(id: Int, fav: Bool) -> AnyPublisher<[AddfavoritModel], Error> {
      return self.remote.addCategoriesFavorite(id: id, fav: fav)
        .flatMap { result -> AnyPublisher<[AddfavoritModel], Error> in
          if result.isEmpty {
            return self.remote.addCategoriesFavorite(id: id, fav: fav)
              .map { GamesMapper.mapCategoryResponsesToDomainsFavoritAdd(input: $0) }
              .flatMap { _ in self.remote.addCategoriesFavorite(id: id, fav: fav)
                .map { GamesMapper.mapCategoryResponsesToDomainsFavoritAdd(input: $0) }
              }
              .eraseToAnyPublisher()
          } else {
            return self.remote.addCategoriesFavorite(id: id, fav: fav)
              .map { GamesMapper.mapCategoryResponsesToDomainsFavoritAdd(input: $0) }
              .eraseToAnyPublisher()
          }
        }.eraseToAnyPublisher()
    }

}
