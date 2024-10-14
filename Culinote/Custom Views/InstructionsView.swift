//
//  InstructionsView.swift
//  Culinote
//
//  Created by Kyle D. Baker on 10/14/24.
//

import UIKit

class InstructionsView: UIView {

    let instructionsLabel = RecipeDetailLabel(textAlignment: .left, fontSize: 18)
    let instructionsContent = RecipeDetailLabel(textAlignment: .left, fontSize: 16)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        instructionsLabel.text = "Instructions"
        instructionsLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        instructionsContent.numberOfLines = 0 // Support for multiple lines of content

        addSubview(instructionsLabel)
        addSubview(instructionsContent)

        setConstraints()
    }

    private func setConstraints() {
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionsContent.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            instructionsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            instructionsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            instructionsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            instructionsContent.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 10),
            instructionsContent.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            instructionsContent.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            instructionsContent.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }

    func setInstructions(_ instructions: String) {
        instructionsContent.text = instructions
    }
}
