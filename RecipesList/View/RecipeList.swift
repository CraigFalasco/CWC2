//
//  ContentView.swift
//  RecipesList
//
//  Created by Craig on 1/2/23.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeVuModel
    private var title: String {
        if model.selectedCategory == nil {
            return Constants.defaultListFilter
        }
        else {
            return model.selectedCategory!
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
                Text(title)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 20)
                
                ScrollView {
                    LazyVStack (alignment: .leading) {
                        ForEach(model.recipes) { r in
                            
                            if model.selectedCategory == nil ||
                                model .selectedCategory == Constants.defaultListFilter ||
                                model.selectedCategory != nil && r.category == model.selectedCategory {
                                
                                NavigationLink(
                                    destination: RecipeDetail(recipe:r),
                                    label: {
                                        HStack(spacing: 20.0) {
                                            Image(r.image)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 75, height: 75, alignment: .center)
                                                .clipped()
                                                .cornerRadius(10)
                                            VStack (alignment: .leading) {
                                                Text(r.name)
                                                    .foregroundColor(.black)
                                                    .font(Font.custom("Avenir Heavy", size: 16))
                                                
                                                RecipeHighlights(highlights: r.highlights)
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    })
                            }
                        }
                    }
                }
            }
            .padding(.leading)
            // this is to display the recipe name in the detail veiw. Keep in mind that it will only show when switching from list to detail,commented out right now and the detail view displays the name as text
            //.navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeVuModel())
    }
}
