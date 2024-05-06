//
//  ViewController.swift
//  testproject1
//
//  Created by Даниил Вахрамеев on 23.02.2024.
//

import UIKit
import SnapKit

let userDefaults = UserDefaults.standard

class FlightsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myTable = UITableView()
    var identifier = "Mycell"
    
    var flightsArr: [Flights] = {
        var blankFlight = Flights(departureCity: "Moscow", arrivalCity: "Sochi", date: "Mar 29", weekDay: "SUN", price: 5347.92)
        var blankFlight1 = Flights(departureCity: "Washington", arrivalCity: "Tampa-Bay", date: "Apr 9", weekDay: "tue", price: 15670.43)
        return [blankFlight, blankFlight1]
    }()
    
    override func viewDidLoad() 	{
        super.viewDidLoad()
        showCurrency()
        self.title = "Menu"
        self.view.backgroundColor = .white	
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(rightBarButton_Click))
        createTable()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(leftButtonDidTap))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myTable.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myTable.reloadData()
    }
    func createTable(){
        self.myTable = UITableView(frame: view.bounds , style: .plain)
        self.myTable.register(FlightsCell.self, forCellReuseIdentifier: FlightsCell.identifier)
        self.myTable.delegate = self
        self.myTable.separatorStyle = .none
        self.myTable.dataSource = self
        self.myTable.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(myTable)
        self.myTable.backgroundColor = .lightGray
    }
    
    // MARK: -Show currency VC only one time
    private func showCurrency() {
        if(!(userDefaults.bool(forKey: userDefaultKeys.keyForCurrencyVC))){
            let currencyVC = CurrencyVC()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                self.present(currencyVC, animated: true)
                userDefaults.setValue(true, forKey: userDefaultKeys.keyForCurrencyVC)
            }
        }
    }
    //MARK:UITableViewDelegate

    //MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flightsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FlightsCell.identifier) as? FlightsCell else { return UITableViewCell() }
        var item = flightsArr[indexPath.row]
        
        cell.accessoryType = .detailDisclosureButton
        cell.tintColor = myTable.backgroundColor
        cell.tintColor = myTable.backgroundColor
        
        let flightName = item.departureCity + " - " + item.arrivalCity
         guard let currency = SelectedCurrency(rawValue: userDefaults.integer(forKey: "selectedCurrency"))?.transferCurrency else {return UITableViewCell()}
        
        item.price = (item.price / currency).rounded(.toNearestOrAwayFromZero)
        
        cell.configure(flightName: flightName, price: item.price, date: item.date.capitalized, weekDay: item.weekDay.uppercased(), cellBackground: self.myTable.backgroundColor ?? .white)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        182
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        switch indexPath.row {
        case indexPath.row:
            let apiController = APIViewController()
            self.present(apiController, animated: true)
        default:
            break
        }
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        tableView.cellForRow(at: indexPath)?.backgroundColor = .lightGray
        return nil
    }
    
    //MARK: - Delete
    
    @objc
    func rightBarButton_Click(){
        self.myTable.isEditing.toggle()
    }
    
    @objc
    func leftButtonDidTap(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func showPresentView(){
        let CurrencyViewController = CurrencyVC()
        self.present(CurrencyViewController, animated: true)
    }
}

