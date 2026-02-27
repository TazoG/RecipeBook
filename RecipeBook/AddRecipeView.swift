//
//  AddRecipeView.swift
//  RecipeBook
//
//  Created by Tazo Gigitashvili on 27.02.26.
//

import SwiftUI

struct AddRecipeView: View {

    @Environment(\.dismiss) private var dismiss

    @State private var name: String = ""
    @State private var description: String = ""
    @State private var selectedCategory: RecipeCategory = .dinner
    @State private var cookingTime: String = ""
    @State private var servings: String = ""
    @State private var ingredientsText: String = ""
    @State private var instructionsText: String = ""

    var body: some View {
        NavigationStack {
            Form {

                Section("Basic Info") {
                    TextField("Recipe Name", text: $name)
                    TextField("Description", text: $description)

                    Picker("Category", selection: $selectedCategory) {
                        ForEach(RecipeCategory.allCases, id: \.self) { category in
                            Text(category.rawValue.capitalized)
                                .tag(category)
                        }
                    }
                }

                Section("Details") {
                    TextField("Cooking Time (minutes)", text: $cookingTime)
                    TextField("Servings", text: $servings)
                        .keyboardType(.decimalPad)
                }

                Section("Ingredients") {
                    TextEditor(text: $ingredientsText)
                        .frame(minHeight: 120)
                }

                Section("Instructions") {
                    TextEditor(text: $instructionsText)
                        .frame(minHeight: 150)
                }
            }
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveAndDismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }

    private func saveAndDismiss() {
        // Saving logic later
        dismiss()
    }
}

#Preview {
    AddRecipeView()
}
