//
//  ViewController.swift
//  Culinote
//
//  Created by Kyle D. Baker on 10/13/24.
//

import UIKit

class RecipeListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var recipes: [Recipe] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Recipes"
        
        configureTableView()
//        fetchRecipes()
        
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RecipeCell")
        view.addSubview(tableView)
    }
    
    
    private func fetchRecipes() {
        recipes = RecipeManager.shared.fetchRecipes()
        tableView.reloadData()
    }
    
    
    // MARK: - UITableView DataSource_
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
        let recipe = recipes[indexPath.row]
        
        cell.textLabel?.text = recipe.title
        return cell
    }
}
