//
//  ViewController.swift
//  Zoo
//
//  Created by Vova on 10.05.22.
//

import UIKit

class ViewController: UIViewController {
    
    var label: UILabel!
    var picker: UIPickerView!
    var button: UIButton!
    var languages: [String] = ["Armenian", "English", "Russian", "Georgian"]

    override func viewDidLoad() {
        super.viewDidLoad()
        initLabel()
        initPicker()
        initButton()
        constructHierarchy()
        activatConstraints()
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        let fullScren = SecondViewController()
        fullScren.modalPresentationStyle = .fullScreen
        present(fullScren, animated: true)
    }

}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languages[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
    
    
}

extension ViewController {
    func initLabel() {
        label = UILabel()
        label.textAlignment = .center
        label.text = "Welcome Zoo"
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initPicker() {
        picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initButton() {
        button = UIButton()
        button.setTitle("Get started", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constructHierarchy() {
        view.addSubview(label)
        view.addSubview(picker)
        view.addSubview(button)
    }
    
    func activatConstraints() {
        NSLayoutConstraint.activate([
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            
            picker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            picker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            picker.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
}
