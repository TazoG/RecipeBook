//
//  ContentView.swift
//  RecipeBook
//
//  Created by Tazo Gigitashvili on 26.02.26.
//

import SwiftUI

struct ContentView: View {
    let recipes = Recipe.samples

    var body: some View {
        NavigationStack {
            List(recipes) { recipe in

                NavigationLink(value: recipe) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text( recipe.name)
                            .font(.headline)

                        Text(recipe.description)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Recipes")
            .navigationDestination(for: Recipe.self) { recipe in
                RecipeDetailView(recipe: recipe)
            }
        }
    }
}

#Preview {
    ContentView()
}
