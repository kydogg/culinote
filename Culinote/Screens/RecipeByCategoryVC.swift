//
//  RecipeByCategoryVC.swift
//  Culinote
//
//  Created by Kyle D. Baker on 10/14/24.
//

import UIKit

class RecipeByCategoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView : UITableView!
    var category: String?
    var recipes: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = category ?? "Recipes"
        
        configureTableView()
    }
    
    
    private func configureTableView() {
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RecipeCell")
        view.addSubview(tableView)
    }

    // MARK: - UITableView DataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
        let recipe = recipes[indexPath.row]
        cell.textLabel?.text = recipe.title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRecipe = recipes[indexPath.row]
        let recipeDetailsVC = RecipeDetailsVC()
        recipeDetailsVC.recipe = selectedRecipe
        navigationController?.pushViewController(recipeDetailsVC, animated: true )
    }

}
