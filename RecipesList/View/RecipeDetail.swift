//
//  RecipeDetail.swift
//  RecipesList
//
//  Created by Craig on 1/5/23.
//

import SwiftUI

struct RecipeDetail: View {
    
    // recipe is not set because it will be set by the list view, see the comment in the Preview
    var recipe:Recipe
    
    @State var selectedServingSize = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                Text(recipe.name)
                    .font(Font.custom("Avenir Heavy", size: 24))
                    .bold()
                    .padding(.top, 20)
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 5, x: -5, y: 5)
                
                VStack(alignment: .leading) {
                    Text("oringinal recipe servings: " + String(recipe.servings))
                        .font(Font.custom("Avenir", size: 22))
                    Text("select serving size")
                        .font(Font.custom("Avenir", size: 28))
                    Picker(" ", selection: $selectedServingSize) {
                        
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                        Text("original").tag(0)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 300)
                    .font(Font.custom("Avenir", size: 22))
    
                }
                Text("Ingredients")
                    .font(Font.custom("Avenir Heavy", size: 22))
                    .padding(.vertical)
                
                
                ForEach(recipe.ingredients) { ingredient in
                    Text(RecipeVuModel.getPortion(ingredient: ingredient, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + ingredient.name.lowercased())
                        .padding(.vertical, 1.0)
                        .font(Font.custom("Avenir", size: 18))
                }
                Text("Directions")
                    .font(Font.custom("Avenir Heavy", size: 22))
                    .padding(.vertical)
                
                // this ForEach gets the index (x) and uses it to put a line number on each deirection step. (x +1)
                ForEach(0..<recipe.directions.count, id: \.self) { x in
                    Text(String(x + 1) + ". " + recipe.directions[x])
                        .font(Font.custom("Avenir", size: 18))
                        .padding(.bottom)
                    
                }
            }
            .padding(.horizontal)
        }
       // .navigationBarTitle(recipe.name)
    }
}
struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        // because recipe is not initialized above, we add this code only to satify the Preview
        let x = RecipeVuModel()
        RecipeDetail(recipe: x.recipes[0])
    }
}
