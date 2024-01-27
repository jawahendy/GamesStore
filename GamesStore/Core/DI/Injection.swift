//
//  Injection.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import Foundation
import Core
import Category
import Favorite

final class Injection: NSObject {
    

func provideCategory<U: UseCase>() -> U where U.Request == Any, U.Response == [CategoryGamesModels] {
        
      let remote = GetCategoriesRemoteDataSource(endpoint: Endpoints.Gets.gameList.url)
      let mapper = CategoryTransformer()

      let repository = GetCategoriesRepository(
        remoteDataSource: remote,
        mapper: mapper)

      return Interactor(repository: repository) as! U
    }
    
 func provideCategoryFavorite<U: UseCaseFavorite>() -> U where U.Request == Any, U.Response == [CategoryfavoritsModels] {
        
      let remote = GetCategoriesFavRemoteDataSource(endpoint: Endpoints.Gets.favoitlist.url)
      let mapper = CategoryTransformerFavorite()


      let repository = GetCategoriesFavorRepository(
        remoteDataSource: remote,
        mapper: mapper)

      return InteractorFavorite(repository: repository) as! U
    }

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
