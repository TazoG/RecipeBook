//
//  EditRecipeView.swift
//  RecipeBook
//
//  Created by Tazo Gigitashvili on 02.03.26.
//

import SwiftUI
import SwiftData

struct EditRecipeView: View {

    @Environment(\.dismiss) private var dismiss
    var recipe: Recipe

    @State private var name: String = ""
    @State private var recipeDescription: String = ""
    @State private var category: RecipeCategory = .dinner
    @State private var cookTime: String = ""
    @State private var servings: String = ""
    @State private var ingredientsText: String = ""
    @State private var instructionsText: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Basic Info") {
                    TextField("Name", text: $name)
                    TextField("Description", text: $recipeDescription)
                    
                    Picker("Category", selection: $category) {
                        ForEach(RecipeCategory.allCases, id: \.self) { cat in
                            Text(cat.rawValue.capitalized).tag(cat)
                        }
                    }
                }
                
                Section("Details") {
                    TextField("Cook Time", text: $cookTime)
                    TextField("Servings", text: $servings)
                }
                
                Section("Ingredients") {
                    TextEditor(text: $ingredientsText)
                        .frame(minHeight: 100)
                }
                
                Section("Instructions") {
                    TextEditor(text: $instructionsText)
                        .frame(minHeight: 100)
                }
            }
            .navigationTitle("Edit Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") { save() }
                }
            }
            .onAppear {
                name = recipe.name
                recipeDescription = recipe.recipeDescription
                category = recipe.category
                cookTime = recipe.cookTime
                servings = recipe.servings
                ingredientsText = recipe.ingredients.joined(separator: "\n")
                instructionsText = recipe.instructions.joined(separator: "\n")
            }
        }
    }
    
    private func save() {
        recipe.name = name
        recipe.recipeDescription = recipeDescription
        recipe.category = category
        recipe.cookTime = cookTime
        recipe.servings = servings
        recipe.ingredients = ingredientsText.components(separatedBy: "\n").filter { !$0.isEmpty }
        recipe.instructions = instructionsText.components(separatedBy: "\n").filter { !$0.isEmpty }
        dismiss()
    }
}

#Preview {
    let container = try! ModelContainer(for: Recipe.self)
    let recipe = Recipe(name: "Test", description: "Test desc", ingredients: ["1 cup"], instructions: ["Step 1"], image: nil, category: .dinner, cookTime: "30", servings: "4", dateCreated: Date())
    container.mainContext.insert(recipe)
    
    return EditRecipeView(recipe: recipe)
        .modelContainer(container)
}
