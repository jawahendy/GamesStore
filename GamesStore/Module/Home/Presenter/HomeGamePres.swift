//
//  HomeGamePres.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {

  private var cancellables: Set<AnyCancellable> = []
  private let router = HomeRouter()
  private let homeUseCase: HomeUseCase

  @Published var categories: [CategoryGamesModel] = []
  @Published var addfavcategories: [AddfavoritModel] = []
  @Published var errorMessage: String = ""
  @Published var loadingState: Bool = false

  init(homeUseCase: HomeUseCase) {
    self.homeUseCase = homeUseCase
  }
    
  func getCategories() {
      loadingState = true
      homeUseCase.getCategories()
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { completion in
          switch completion {
          case .failure:
            self.errorMessage = String(describing: completion)
          case .finished:
            self.loadingState = false
          }
        }, receiveValue: { categories in
          self.categories = categories
        })
        .store(in: &cancellables)
    }
    
    func addFavCategories(id: Int, fav: Bool) {
//        loadingState = true
        homeUseCase.addCategoriesFavorite(id: id, fav: fav)
          .receive(on: RunLoop.main)
          .sink(receiveCompletion: { completion in
            switch completion {
            case .failure:
              self.errorMessage = String(describing: completion)
                print(String(describing: completion))
            case .finished:
              self.loadingState = false
            }
          }, receiveValue: { categories in
            self.addfavcategories = categories
          })
          .store(in: &cancellables)
      }



}
