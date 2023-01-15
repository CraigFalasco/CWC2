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
            
            Image(recipe.image)
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading) {
                
                Text("Ingredients")
                    .font(.title)
                    .padding(.all, 10)
                    
                ForEach(recipe.ingredients) { ingredient in
                    Text(ingredient.name)
                        .padding(.horizontal, 10)
                }
                Text("Directions")
                    .font(.title)
                    .padding(.all, 10)
                
                // this ForEach gets the index (x) and uses it to put a line number on each deirection step. (x +1)
                ForEach(0..<recipe.directions.count, id: \.self) { x in
                    Text(String(x + 1) + ". " + recipe.directions[x])
                        .padding([.leading, .bottom, .trailing], 10.0)
                }
            }
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
