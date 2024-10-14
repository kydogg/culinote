//
//  IngredientsView.swift
//  Culinote
//
//  Created by Kyle D. Baker on 10/14/24.
//

import UIKit

class IngredientsView: UIView {
    
    let ingredientsLabel = RecipeDetailLabel(textAlignment: .left, fontSize: 18)
    let ingredientsContent = RecipeDetailLabel(textAlignment: .left, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        ingredientsLabel.text = "Ingredients"
        ingredientsLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        ingredientsContent.numberOfLines = 0
        
        addSubview(ingredientsLabel)
        addSubview(ingredientsContent)
                
        configureIngredientsLabel()
        configureIngredientsContent()
    }
    
    func configureIngredientsLabel() {
        NSLayoutConstraint.activate([
            ingredientsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            ingredientsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            ingredientsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
    
    func configureIngredientsContent() {
        NSLayoutConstraint.activate([
            ingredientsContent.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: 10),
            ingredientsContent.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            ingredientsContent.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            ingredientsContent.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
        
    }
}

