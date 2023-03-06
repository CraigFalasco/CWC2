//
//  RecipeCategoryView.swift
//  RecipesList
//
//  Created by Craig on 3/6/23.
//

import SwiftUI

struct RecipeCategoryView: View {
    
    @EnvironmentObject var model: RecipeVuModel
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Categories")
                .font(.largeTitle)
                .bold()
                .padding(.top, 20)
            
            GeometryReader { geo in
                
                ScrollView {
                    
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 20, alignment: .top),GridItem(.flexible(), spacing: 20, alignment: .top)], alignment: .center, spacing: 20) {
                        ForEach(Array(model.categories), id: \.self) { category in
                            Button {
                                
                                // switch to list view
                                selectedTab = Constants.listTab
                                
                                // set the selected cstegory
                                model.selectedCategory = category
                            } label: {
                                VStack {
                                    Image(category)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: (geo.size.width - 20) / 2, height: (geo.size.width - 20) / 2)
                                        .cornerRadius(10)
                                        .clipped()
                                    Text(category)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}
/*
struct RecipeCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryView(selectedTab: Constants.categoriesTab)
            .environmentObject(RecipeVuModel())
    }
}
*/
