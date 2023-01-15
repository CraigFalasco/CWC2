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
        Text("Featured View")
    }
}

struct RecipeFeatured_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatured()
    }
}
