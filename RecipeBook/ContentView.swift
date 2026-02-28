//
//  ContentView.swift
//  RecipeBook
//
//  Created by Tazo Gigitashvili on 26.02.26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText = ""
    @State private var showingAddRecipe = false
    @State private var recipes = Recipe.samples

    var filteredRecipes: [Recipe] {
        if searchText.isEmpty {
            return recipes
        }

        return recipes.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            List(filteredRecipes) { recipe in

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
            .searchable(text: $searchText)
            .navigationTitle("Recipes")
            .navigationDestination(for: Recipe.self) { recipe in
                RecipeDetailView(recipe: recipe)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddRecipe = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddRecipe) {
                AddRecipeView(recipes: $recipes)
            }
        }
    }
}

#Preview {
    ContentView()
}
