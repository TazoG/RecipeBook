//
//  ContentView.swift
//  RecipeBook
//
//  Created by Tazo Gigitashvili on 26.02.26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var searchText = ""
    @State private var selectedCategory: RecipeCategory? = nil
    @State private var showingAddRecipe = false
    @Query private var recipes: [Recipe]

    var filteredRecipes: [Recipe] {
        recipes.filter { recipe in

            let matchesSearch =
            searchText.isEmpty ||
            recipe.name.localizedCaseInsensitiveContains(searchText)

            let matchesCategory =
            selectedCategory == nil ||
            recipe.category == selectedCategory

            return matchesSearch && matchesCategory
        }
    }

    var body: some View {
        NavigationStack {
            List(filteredRecipes) { recipe in

                NavigationLink(value: recipe) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(recipe.name)
                            .font(.headline)

                        Text(recipe.recipeDescription)
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
            .sheet(isPresented: $showingAddRecipe) {
                AddRecipeView()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        Button("All") { selectedCategory = nil }

                        ForEach(RecipeCategory.allCases, id: \.self) { category in
                            Button(category.rawValue.capitalized) {
                                selectedCategory = category
                            }
                        }

                    } label: {
                        Label("Filter", systemImage: "line.3.horizontal.decrease.circle")
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddRecipe = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
