//
//  Injection.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import Foundation

final class Injection: NSObject {

  private func provideRepository() -> GamesRepositoryProtocol {

    let remote: RemoteDataSource = RemoteDataSource.sharedInstance

    return GamesRepository.sharedInstance(remote)
  }

  func provideHome() -> HomeUseCase {
    let repository = provideRepository()
    return HomeInteractor(repository: repository)
  }
    
  func provideFavorite() -> FavorUseCase {
      let repository = provideRepository()
      return FavoritInteractor(repository: repository)
  }

    func provideDetail(category: CategoryGamesModel) -> DetailUseCase {
    let repository = provideRepository()
    return DetailInteractor(repository: repository, category: category)
  }
    
    func provideDetailFavorite(categoryFav: CategoryfavoritModel) -> FavoritDetailUseCase {
      let repository = provideRepository()
     return FavoritDetailInteractor(repository: repository, category: categoryFav)
 }

}
