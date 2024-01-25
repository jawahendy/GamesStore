//
//  DetailPresent.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 18/01/24.
//

import SwiftUI

class DetailPresenter: ObservableObject {

  private let detailUseCase: DetailUseCase

  @Published var category: CategoryGamesModel
  @Published var errorMessage: String = ""
  @Published var loadingState: Bool = false

  init(detailUseCase: DetailUseCase) {
    self.detailUseCase = detailUseCase
    category = detailUseCase.getCategory()
  }

}
