//
//  RecipeFeatured.swift
//  RecipesList
//
//  Created by Craig on 1/13/23.
//

import SwiftUI

struct RecipeFeatured: View {
    
    @EnvironmentObject var model:RecipeVuModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        let featuredRecipes = model.recipes.filter({ $0.featured })
        
        VStack (alignment: .leading){
            
            Text("Featured Recipes")
                .font(.largeTitle)
                .bold()
                .padding([.top, .leading], 20)
                
            
            GeometryReader { geo in
                
                TabView (selection: $tabSelectionIndex) {
                    
                    ForEach (0..<featuredRecipes.count, id: \.self) { index in
                            
                        Button(action: {
                                self.isDetailViewShowing = true
                                
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        
                                    VStack(spacing: 0) {
                                        Image(featuredRecipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()

                                        Text(featuredRecipes[index].name)
                                            .font(.title3)
                                            .fontWeight(.bold)
                                            .padding(.bottom, 10)
                                    }
                                }
                            })
                            .tag(index)
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 10, x: -5, y: 5)
                    }
                }
                // this makes the tab view swipe-able
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                // this adds a background to the dots so they are visible
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading ,spacing: 10) {
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
                Text("Prep Time: " + model.recipes[tabSelectionIndex].prepTime)
                Text("Cook Time: " + model.recipes[tabSelectionIndex].cookTime)
                Text("Total Time: " + model.recipes[tabSelectionIndex].totalTime)
            }
            .padding([.leading, .bottom], 20.0)
            .fontWeight(.bold)
        }
        .sheet(isPresented: $isDetailViewShowing) {
            RecipeDetail(recipe: featuredRecipes[tabSelectionIndex])
        }
    }
}

struct RecipeFeatured_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatured()
            .environmentObject(RecipeVuModel())
    }
}
