//
//  ViewController.swift
//  Culinote
//
//  Created by Kyle D. Baker on 10/13/24.
//

import UIKit

class RecipeListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var categories = [
        "Breakfast",
        "Lunch",
        "Dinner",
        "Dessert",
        "Snacks",
        "Appetizers",
        "Drinks",
        "Salads",
        "Soups",
        "Vegetarian",
        "Vegan",
        "Gluten-Free",
        "Keto/Low-Carb",
        "Pasta",
        "Baked Goods",
        "Slow Cooker",
        "Grilling/BBQ",
        "Seafood",
        "Healthy",
        "Comfort Food",
        "International"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Recipe Categories"
        
        configureTableView()
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryCell")
        view.addSubview(tableView)
    }
    
    // MARK: - UITableView DataSource
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return categories.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
            let category = categories[indexPath.row]
            cell.textLabel?.text = category
            cell.accessoryType = .disclosureIndicator // Show an arrow to indicate navigation
            return cell
        }
        
        // Handle navigation to recipes by category
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedCategory = categories[indexPath.row]
            let recipeListVC = RecipeByCategoryVC()
            recipeListVC.category = selectedCategory // Pass the selected category to the next VC
            navigationController?.pushViewController(recipeListVC, animated: true)
        }
}
