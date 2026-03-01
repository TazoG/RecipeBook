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
        let count = try! context.fetchCount(FetchDescriptor<Recipe>())
        if count == 0 {
            Recipe.samples.forEach { context.insert($0) }
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
