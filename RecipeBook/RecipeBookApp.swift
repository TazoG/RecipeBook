//
//  RecipeBookApp.swift
//  RecipeBook
//
//  Created by Tazo Gigitashvili on 26.02.26.
//

import SwiftUI
import SwiftData

@main
struct RecipeBookApp: App {
    let sharedModelContainer = try! ModelContainer(for: Recipe.self)

    @MainActor
    func seedIfNeeded() async {
        let context = sharedModelContainer.mainContext
        let descriptor = FetchDescriptor<Recipe>()
        let count = (try? context.fetchCount(descriptor)) ?? 0
        
        if count == 0 {
            let samples = [
                Recipe(name: "Classic Pancakes", description: "Fluffy American-style pancakes", ingredients: ["2 cups flour", "2 eggs", "1 cup milk", "2 tbsp sugar"], instructions: ["Mix dry", "Add wet", "Cook on griddle"], image: nil, category: .breakfast, cookTime: "20 min", servings: "4", dateCreated: Date()),
                Recipe(name: "Spaghetti Bolognese", description: "Rich and hearty Italian meat sauce pasta", ingredients: ["200g spaghetti", "300g ground beef", "1 onion", "2 cloves garlic", "400g canned tomatoes"], instructions: ["Boil pasta", "Sauté onion and garlic", "Add beef", "Simmer tomatoes", "Serve"], image: nil, category: .dinner, cookTime: "40 min", servings: "4", dateCreated: Date()),
                Recipe(name: "Caesar Salad", description: "Crisp romaine lettuce with creamy Caesar dressing", ingredients: ["1 head romaine lettuce", "1/2 cup croutons", "Parmesan cheese", "Caesar dressing"], instructions: ["Wash lettuce", "Add croutons", "Toss with dressing"], image: nil, category: .lunch, cookTime: "15 min", servings: "2", dateCreated: Date()),
                Recipe(name: "Chocolate Brownies", description: "Fudgy and rich homemade brownies", ingredients: ["1 cup butter", "2 cups sugar", "4 eggs", "1 cup cocoa powder", "1 cup flour"], instructions: ["Preheat oven", "Mix butter and sugar", "Add eggs", "Stir in cocoa and flour", "Bake"], image: nil, category: .dessert, cookTime: "35 min", servings: "6", dateCreated: Date())
            ]
            for recipe in samples {
                context.insert(recipe)
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    await seedIfNeeded()
                }
        }
        .modelContainer(sharedModelContainer)
    }
}
