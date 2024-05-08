//
//  FirstViewController.swift
//  testproject1
//
//  Created by Даниил Вахрамеев on 27.02.2024.
//

import UIKit

class FirstViewController: UIViewController {

    
    let button = UIButton()
    let label = UILabel()
   
    var count = 2
    let name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLabel()
        createButton()
        self.view.backgroundColor = .white
    }
    public func alertAppear(){
        let alertWindow = UIAlertController(title: "Your name is:", message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Confirm", style: .default) { [weak self] (alertAction) in
            guard let self = self,
                  let name = alertWindow.textFields?[0].text else { return }
            let viewController = FlightsVC()
            viewController.title = "Привет \(name)"
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        alertWindow.addTextField()
        alertWindow.addAction(alertAction)
        self.present(alertWindow, animated: true)
    }
    private func createLabel(){
        label.text = "Hi, my dear user"
        label.textAlignment = .center
        label.textColor = .black
        label.frame = CGRect(x: 120, y: 140, width: 140, height: 140)
        self.view.addSubview(label)
    }
    private func createButton(){
        button.setTitle("Enter Name", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x: 125, y: 340, width: 130, height: 60)
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        button.backgroundColor = .black
        self.view.addSubview(button)
    }
    @objc
    func buttonClick(){
        alertAppear()
    }   
    @objc
    func rightButtonDidTap(){
        if count % 2 == 0{
            self.view.backgroundColor = .black
            label.textColor = .white
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            count += 1
        }
        else{
            self.view.backgroundColor = .white
            label.textColor = .black
            button.backgroundColor = .black
            button.setTitleColor(.white, for: .normal)
            count += 1
        }
    }
}
