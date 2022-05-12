//
//  SecondViewController.swift
//  Zoo
//
//  Created by Vova on 12.05.22.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    var stachView: UIStackView!
    var button: UIButton!
    var animalType: [String] = ["Predator", "Mammal", "Amphibian", "Insect"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initStackView()
        initZoo()
        activatConstraints()
    }
}

extension SecondViewController {
    func initStackView() {
        stachView = UIStackView()
        stachView.axis = .vertical
        stachView.spacing = 10
        stachView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stachView)
    }
    
    func initZoo() {
        for index in animalType {
            button = UIButton()
            button.setTitle(index, for: .normal)
            button.backgroundColor = .black
            button.layer.cornerRadius = 10
            button.translatesAutoresizingMaskIntoConstraints = false
            
            stachView.addArrangedSubview(button)
        }
    }
    
    func activatConstraints() {
        NSLayoutConstraint.activate([
            stachView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            stachView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stachView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            
        ])
    }

}
