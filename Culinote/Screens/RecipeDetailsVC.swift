//
//  RecipeDetailsVC.swift
//  Culinote
//
//  Created by Kyle D. Baker on 10/14/24.
//

import UIKit

class RecipeDetailsVC: UIViewController {
    
    var recipe: Recipe?
    let titleLabel = RecipeDetailLabel(textAlignment: .center, fontSize: 24)
    let imageView = RecipeDetailImageView(frame: .zero)
    let ingredientsView = IngredientsView(frame: .zero)
    let instructionsView = InstructionsView(frame: .zero)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureUIElements()
        layoutUI()
    }
    
    private func configureUIElements() {
        
        
    }
    
    
    private func layoutUI() {
        view.addSubviews(titleLabel, imageView, ingredientsView, instructionsView)
        
        let padding: CGFloat = 20
        // Title label constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Image view constraints
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // Ingredients view constraints
        NSLayoutConstraint.activate([
            ingredientsView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: padding),
            ingredientsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            ingredientsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            ingredientsView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ])
        
        // Instructions view constraints
        NSLayoutConstraint.activate([
            instructionsView.topAnchor.constraint(equalTo: ingredientsView.bottomAnchor, constant: padding),
            instructionsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            instructionsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            instructionsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
        ])
    }
}
