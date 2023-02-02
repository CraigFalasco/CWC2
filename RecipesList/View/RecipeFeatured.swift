//
//  RecipeFeatured.swift
//  RecipesList
//
//  Created by Craig on 1/13/23.
//

import SwiftUI

struct RecipeFeatured: View {
    
    @EnvironmentObject var model:RecipeVuModel
    
    var body: some View {
        
        VStack (alignment: .leading){
            
            Text("Featured Recipes")
                .font(.largeTitle)
                .bold()
                .padding([.top, .leading], 20)
                
            
            GeometryReader { geo in
                
                TabView {
                    
                    ForEach (0..<model.recipes.count, id: \.self) { index in
                        if model.recipes[index].featured == true {
                            
                            ZStack {
                                
                                Rectangle()
                                    .foregroundColor(.white)
                                    
                                VStack(spacing: 0) {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()

                                    Text(model.recipes[index].name)
                                        .font(.title3)
                                        .padding(.bottom, 10)
 
                                }
                            }
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 10, x: -5, y: 5)
                        }
                    }
                }
                // this makes the tab view swipe-able
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                // this adds a background to the dots so they are visible
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading ,spacing: 10) {
                Text("Prep Time: ")
                Text("Cook Time: ")
                Text("Total Time: ")
                Text("highlights will go here")
            }
            .padding([.leading, .bottom], 20.0)
        }
        
    }
}

struct RecipeFeatured_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatured()
            .environmentObject(RecipeVuModel())
    }
}
