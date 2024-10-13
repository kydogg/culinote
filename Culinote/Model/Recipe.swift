//
//  Recipe.swift
//  Culinote
//
//  Created by Kyle D. Baker on 10/13/24.
//

import CoreData
import UIKit

@objc(Recipe)
class Recipe: NSManagedObject {
    @NSManaged var title: String?
    @NSManaged var ingredients: String?
    @NSManaged var instructions: String?
    @NSManaged var image: Data?
    
}
