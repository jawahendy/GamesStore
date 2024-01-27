//
//  FavoriteView.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 22/01/24.
//

import SwiftUI
import Core
import Category
import Favorite

struct FavoriteView: View {

    @ObservedObject var presenter: GetListFavoritePresenter<Any, CategoryfavoritsModels, InteractorFavorite<Any, [CategoryfavoritsModels], GetCategoriesFavorRepository<GetCategoriesFavRemoteDataSource, CategoryTransformerFavorite>>>

  var body: some View {
    ZStack {
      if presenter.isLoading {
        VStack {
          Text("Loading...")
          ProgressView()
        }
      } else if self.presenter.list.count == 0 {
          Text("There is No Have Favorite Movie You Add")
            .font(.subheadline)
            .bold().foregroundStyle(.black)
      } else {
        ScrollView(.vertical, showsIndicators: false) {
          ForEach(
            self.presenter.list,
            id: \.id
          ) { category in
            ZStack {
                linkBuilder(for: category) {
                FavoriteCategoryRow(category: category)
              }
            }.padding(8)
          }
        }
      }
    }.onAppear {
        self.presenter.getListFavorit(request: nil)
    }.refreshable {
        self.presenter.getListFavorit(request: nil)
    }
  }
    
    func linkBuilder<Content: View>(
      for category: CategoryfavoritsModels,
      @ViewBuilder content: () -> Content
    ) -> some View {

      NavigationLink(
        destination: FavotiteRouter().makeDetailView(for: category)
      ) { content() }
    }

}
