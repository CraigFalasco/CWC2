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
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
            Text(recipe.name)
                .font(.largeTitle)
                .bold()
                .padding(.top, 20)
            
            Image(recipe.image)
                .resizable()
                .scaledToFit()
            
            
                Text("Ingredients")
                    .font(.title)
                    .padding(.vertical)
                    
                    
                ForEach(recipe.ingredients) { ingredient in
                    Text(ingredient.name)
                        .padding(.vertical, 1.0)
                }
                Text("Directions")
                    .font(.title)
                    .padding(.vertical)
                
                // this ForEach gets the index (x) and uses it to put a line number on each deirection step. (x +1)
                ForEach(0..<recipe.directions.count, id: \.self) { x in
                    Text(String(x + 1) + ". " + recipe.directions[x])
                        .padding(.bottom)
                        
                }
            }
            .padding(.leading)
        }
        .navigationBarTitle(recipe.name)
    }
}
struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        // because recipe is not initialized above, we add this code only to satify the Preview
        let x = RecipeVuModel()
        RecipeDetail(recipe: x.recipes[0])
    }
}
