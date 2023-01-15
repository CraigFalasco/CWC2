//
//  RecipeTabView.swift
//  RecipesList
//
//  Created by Craig on 1/13/23.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView {
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.number")
                        Text("recipe list")
                    }
                }
            RecipeFeatured()
                .tabItem {
                    VStack {
                        Image(systemName: "text.badge.star")
                        Text("Featured Recipe")
                    }
                }
        }.environmentObject(RecipeVuModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
