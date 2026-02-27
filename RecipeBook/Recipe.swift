//
//  Recipe.swift
//  RecipeBook
//
//  Created by Tazo Gigitashvili on 26.02.26.
//

import Foundation

struct Recipe: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    var description: String
    var ingredients: [String]
    var instructions: [String]
    var image: Data?
    var category: RecipeCategory
    var cookTime: String
    var servings: String
    var dateCreated: Date
}

enum RecipeCategory: String, CaseIterable, Codable {
    case breakfast
    case lunch
    case dinner
    case dessert
    case snack
    case appetizer
}

extension Recipe {
    static let samples: [Recipe] = [
        Recipe(
            name: "Classic Pancakes",
            description: "Fluffy American-style pancakes",
            ingredients: [
                "2 cups flour",
                "2 eggs",
                "1 cup milk",
                "2 tbsp sugar"
            ],
            instructions: [
                "Mix dry",
                "Add wet",
                "Cook on griddle"
            ],
            image: nil,
            category: .breakfast,
            cookTime: "20 min",
            servings: "4",
            dateCreated: Date()
        ),

        Recipe(
            name: "Spaghetti Bolognese",
            description: "Rich and hearty Italian meat sauce pasta",
            ingredients: [
                "200g spaghetti",
                "300g ground beef",
                "1 onion",
                "2 cloves garlic",
                "400g canned tomatoes",
                "Olive oil",
                "Salt & pepper"
            ],
            instructions: [
                "Boil pasta in salted water",
                "Sauté onion and garlic in olive oil",
                "Add ground beef and cook until browned",
                "Stir in tomatoes and simmer 15 minutes",
                "Serve sauce over pasta"
            ],
            image: nil,
            category: .dinner,
            cookTime: "40 min",
            servings: "4",
            dateCreated: Date()
        ),

        Recipe(
            name: "Caesar Salad",
            description: "Crisp romaine lettuce with creamy Caesar dressing",
            ingredients: [
                "1 head romaine lettuce",
                "1/2 cup croutons",
                "Parmesan cheese",
                "Caesar dressing",
                "Grilled chicken (optional)"
            ],
            instructions: [
                "Wash and chop lettuce",
                "Add croutons and parmesan",
                "Toss with dressing",
                "Top with sliced grilled chicken if desired"
            ],
            image: nil,
            category: .lunch,
            cookTime: "15 min",
            servings: "2",
            dateCreated: Date()
        ),

        Recipe(
            name: "Chocolate Brownies",
            description: "Fudgy and rich homemade brownies",
            ingredients: [
                "1 cup butter",
                "2 cups sugar",
                "4 eggs",
                "1 cup cocoa powder",
                "1 cup flour",
                "1 tsp vanilla extract"
            ],
            instructions: [
                "Preheat oven to 180°C",
                "Mix melted butter and sugar",
                "Add eggs and vanilla",
                "Stir in cocoa and flour",
                "Bake for 25–30 minutes"
            ],
            image: nil,
            category: .dessert,
            cookTime: "35 min",
            servings: "6",
            dateCreated: Date()
        )
    ]
}
