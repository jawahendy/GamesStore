//
//  FavoritePresenter.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 22/01/24.
//

import SwiftUI
import Combine

class FavoritePresenter: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    private let router = FavotiteRouter()
    private let favUseCase: FavorUseCase

    @Published var categories: [CategoryfavoritModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(favUseCase: FavorUseCase) {
      self.favUseCase = favUseCase
    }
      
    func getCategoriesFavorite() {
        loadingState = true
        favUseCase.getCategoriesFavorite()
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


    func linkBuilder<Content: View>(
      for category: CategoryfavoritModel,
      @ViewBuilder content: () -> Content
    ) -> some View {
      NavigationLink(
      destination: router.makeDetailView(for: category)) { content() }
    }
}
