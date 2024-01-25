//
//  FavoriteView.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 22/01/24.
//

import SwiftUI

struct FavoriteView: View {

  @ObservedObject var presenter: FavoritePresenter

  var body: some View {
    ZStack {
      if presenter.loadingState {
        VStack {
          Text("Loading...")
          ProgressView()
        }
      } else {
        ScrollView(.vertical, showsIndicators: false) {
          ForEach(
            self.presenter.categories,
            id: \.id
          ) { category in
            ZStack {
              self.presenter.linkBuilder(for: category) {
                FavoriteCategoryRow(category: category)
              }
            }.padding(8)
          }
        }
      }
    }.onAppear {
        self.presenter.getCategoriesFavorite()
    }.refreshable {
        self.presenter.getCategoriesFavorite()
    }
  }

}
