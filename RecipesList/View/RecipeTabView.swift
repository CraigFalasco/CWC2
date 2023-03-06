//
//  RecipeTabView.swift
//  RecipesList
//
//  Created by Craig on 1/13/23.
//

import SwiftUI

struct RecipeTabView: View {
    
    @State var selectedTab = Constants.featuredTab
    
    var body: some View {
        
        TabView (selection: $selectedTab) {
            
            RecipeFeatured()
                .tabItem {
                    VStack {
                        Image(systemName: "text.badge.star")
                        Text("Featured Recipe")
                    }
                }
                .tag(Constants.featuredTab)
            
            RecipeCategoryView(selectedTab: $selectedTab)
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid.2x2")
                        Text("Category list")
                    }
                }
                .tag(Constants.categoriesTab)
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.number")
                        Text("Recipe list")
                    }
                }
                .tag(Constants.listTab)
            
        }.environmentObject(RecipeVuModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
