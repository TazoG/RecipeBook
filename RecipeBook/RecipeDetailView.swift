//
//  RecipeDetailView.swift
//  RecipeBook
//
//  Created by Tazo Gigitashvili on 27.02.26.
//

import SwiftUI
import SwiftData

struct RecipeDetailView: View {

    @State private var isEditing = false

    let recipe: Recipe

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 20) {

                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(height: 200)
                    .overlay {
                        Image(systemName: "photo")
                            .font(.largeTitle)
                            .foregroundStyle(.gray)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                VStack(alignment: .leading, spacing: 8) {
                    Text(recipe.name)
                        .font(.title)
                        .fontWeight(.bold)

                    Text(recipe.category.rawValue.capitalized)
                        .font(.caption)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(.blue.opacity(0.15))
                        .clipShape(Capsule())
                }

                HStack(spacing: 20) {
                    Label(recipe.cookTime, systemImage: "clock")
                    Label(recipe.servings, systemImage: "person.2")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)

                Divider()

                VStack(alignment: .leading, spacing: 10) {
                    Text("Ingredients")
                        .font(.headline)

                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 6))
                                .padding(.top, 6)

                            Text(ingredient)
                        }
                    }
                }

                Divider()

                VStack(alignment: .leading, spacing: 10) {
                    Text("Instructions")
                        .font(.headline)

                    ForEach(recipe.instructions.indices, id: \.self) { index in
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 6))
                                .padding(.top, 6)

                            Text("\(index + 1).")
                                .fontWeight(.semibold)

                            Text(recipe.instructions[index])
                        }
                    }
                }
            }
            .toolbar {
                Button("Edit") {
                    isEditing = true
                }
            }
            .sheet(isPresented: $isEditing) {
                EditRecipeView(recipe: recipe)
            }
            .padding()
            .navigationTitle("Recipe")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    let container = try! ModelContainer(
        for: Recipe.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )

    let sample = Recipe(
        name: "Preview Pancakes",
        description: "Preview recipe",
        ingredients: ["Flour", "Eggs"],
        instructions: ["Mix", "Cook"],
        image: nil,
        category: .breakfast,
        cookTime: "10 min",
        servings: "2",
        dateCreated: Date()
    )

    container.mainContext.insert(sample)

    return RecipeDetailView(recipe: sample)
        .modelContainer(container)
}
