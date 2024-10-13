//
//  RecipeManager.swift
//  Culinote
//
//  Created by Kyle D. Baker on 10/13/24.
//

import CoreData
import UIKit

class RecipeManager {
    static let shared = RecipeManager()

    private var persistentContainer: NSPersistentContainer {
        // Access the persistent container from the AppDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Unable to access AppDelegate")
        }
        return appDelegate.persistentContainer
    }

    // Fetch all recipes
    func fetchRecipes() -> [Recipe] {
        let fetchRequest = NSFetchRequest<Recipe>(entityName: "Recipe")
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print("Error fetching recipes: \(error)")
            return []
        }
    }

    // Add a new recipe
    func addRecipe(title: String, ingredients: String, instructions: String, image: UIImage?) {
        let context = persistentContainer.viewContext
        let newRecipe = Recipe(context: context)
        newRecipe.title = title
        newRecipe.ingredients = ingredients
        newRecipe.instructions = instructions
        
        if let image = image {
            newRecipe.image = image.jpegData(compressionQuality: 1.0)
        }
        saveContext()

    }

    // Delete a recipe
    func deleteRecipe(_ recipe: Recipe) {
        let context = persistentContainer.viewContext
        context.delete(recipe)
        saveContext()
    }

    // Save the context
    private func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Failed to save context: \(error)")
            }
        }
    }
}
