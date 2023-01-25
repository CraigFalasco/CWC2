//
//  ContentView.swift
//  RecipesList
//
//  Created by Craig on 1/2/23.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeVuModel
    
    var body: some View {

            NavigationView {
                
                List(model.recipes) { r in
                    
                    NavigationLink(
                        destination: RecipeDetail(recipe:r),
                        label: {
                            
                            HStack(spacing: 20.0) {
                                Image(r.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 75, height: 75, alignment: .center)
                                    .clipped()
                                    .cornerRadius(5)
                                Text(r.name)
                            }
                        })
                }
                // this is to display the recipe name in the detail veiw. Keep in mind that it will only show when switching from list to detail.
                .navigationBarTitle("All Recipes")
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeVuModel())
    }
}
