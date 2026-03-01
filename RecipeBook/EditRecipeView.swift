//
//  EditRecipeView.swift
//  RecipeBook
//
//  Created by Tazo Gigitashvili on 02.03.26.
//

import SwiftUI

struct EditRecipeView: View {

    @Environment(\.dismiss) private var dismiss
    var recipe: Recipe

    @State private var name: String = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
            }
            .navigationTitle("Edit")
            .toolbar {
                Button("Save") {
                    recipe.name = name
                    dismiss()
                }
            }
            .onAppear {
                name = recipe.name
            }
        }
    }
}

#Preview {
    EditRecipeView(recipe: Recipe.samples[0])
}
