//
//  PresentViewController.swift
//  testproject1
//
//  Created by Guest Acc on 22.03.2024.
//

import UIKit

let userDefaultKeys = UserDefaultsKeys()

struct SelectedValues {
    static var selectedCurrency: SelectedCurrency = .rub
}

class CurrencyVC: UIViewController{

    var myTable = UITableView()
    
    var userDefaults = UserDefaults.standard
    
    var closeButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Подтвердить выбор", for: .normal)
        button.frame = .init(x: 20, y: 675, width: 350, height: 75)
        button.layer.cornerRadius = 10
//        button.layer.borderColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
//        button.layer.borderWidth = 1
        
        
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
//        haveShownCurrencyVC =  userDefaults.object(forKey: "haveShownCurrencyVC")
        self.view.backgroundColor = .darkGray
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        createTable()
        setAppereance()
        self.view.addSubview(closeButton)
    }
    
    private func createTable(){
        self.myTable = UITableView(frame: view.bounds, style: .plain)
        myTable.register(PresentViewCell.self, forCellReuseIdentifier: PresentViewCell.identifier)
        self.myTable.dataSource = self
        self.myTable.delegate = self
        self.myTable.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        self.view.addSubview(myTable)
    }
    
    
    private func setAppereance(){
        self.myTable.backgroundColor = .darkGray
    }
    
    
    @objc
    private func closeButtonTapped(){
        userDefaults.set(true, forKey: "haveShownCurrencyVC")
        self.dismiss(animated: true)
    }
    
}


extension CurrencyVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SelectedCurrency.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.myTable.dequeueReusableCell(withIdentifier: PresentViewCell.identifier, for: indexPath) as? PresentViewCell else {return UITableViewCell()}
        
        let currencyArr = SelectedCurrency.allCases
        let currencyAbbreviatedText = currencyArr[indexPath.row].abbreviatedText
        let currencyFullText = currencyArr[indexPath.row].fullText
        
        switch indexPath.row {
        case 0,1,2:
            cell.configure(abbreviatedText: currencyAbbreviatedText, fullText: currencyFullText)
        default:
            return UITableViewCell()
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            userDefaults.set(0, forKey: userDefaultKeys.keyForSelectedCurrency)
            SelectedValues.selectedCurrency = SelectedCurrency(rawValue: userDefaults.integer(forKey: userDefaultKeys.keyForSelectedCurrency)) ?? .rub
        case 1:
            userDefaults.set(1, forKey: userDefaultKeys.keyForSelectedCurrency)
            SelectedValues.selectedCurrency = SelectedCurrency(rawValue: userDefaults.integer(forKey: userDefaultKeys.keyForSelectedCurrency)) ?? .rub
        case 2:
            userDefaults.set(2, forKey: userDefaultKeys.keyForSelectedCurrency)
            SelectedValues.selectedCurrency = SelectedCurrency(rawValue: userDefaults.integer(forKey: userDefaultKeys.keyForSelectedCurrency)) ?? .rub
        default:
            break
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
