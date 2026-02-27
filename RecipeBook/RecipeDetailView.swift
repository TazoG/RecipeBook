//
//  RecipeDetailView.swift
//  RecipeBook
//
//  Created by Tazo Gigitashvili on 27.02.26.
//

import SwiftUI

struct RecipeDetailView: View {
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
                    Text("Instructions")
                        .font(.headline)

                    ForEach(Array(recipe.instructions.enumerated()), id: \.offset) { index, step in
                        HStack(alignment: .top, spacing: 8) {
                            Text("\(index + 1).")
                                .fontWeight(.semibold)

                            Text(step)
                        }
                    }
                }
            }
            .navigationTitle("Recipe")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    RecipeDetailView(recipe: Recipe.samples[0])
}
