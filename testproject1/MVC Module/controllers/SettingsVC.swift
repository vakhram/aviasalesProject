//
//  ThirdViewController.swift
//  testproject1
//
//  Created by Даниил Вахрамеев on 27.02.2024.
//

import UIKit

class SettingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let secondVC = InANutshellVC()
    let settingsIdentifier = "settingsCell"
    var settingsTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UIScreen.main.bounds.height)
        self.title = "Settings"
        createTable()
        createHeaderForTable()
                // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    private func createTable() {
        self.settingsTable = .init(frame: view.bounds, style: .insetGrouped)
        settingsTable.register(UITableViewCell.self, forCellReuseIdentifier: settingsIdentifier)
        settingsTable.register(BookFasterCell.self,forCellReuseIdentifier:
                                BookFasterCell.identifier)
        settingsTable.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        settingsTable.separatorStyle = .none
        settingsTable.delegate = self
        settingsTable.dataSource = self
        settingsTable.backgroundColor = .lightGray
        
        view.addSubview(settingsTable)
    }
    
    private func createHeaderForTable() {
        
        
        let tableHeader = SettingsTableHeaderView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.24))
//        settingsTable.sectionHeaderTopPadding = 0.0
        tableHeader.signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        self.settingsTable.tableHeaderView = tableHeader
        
    }
    @objc
    func leftButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func signInButtonTapped() {
        let LoginViewController = Builder.buildLogInModule()
        self.present(LoginViewController, animated: true)
    }
    //MARK: UITableViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    
    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        switch indexPath.section{
        case 0:
            switch indexPath.row{
            case 0:
                let currencyVC = CurrencyVC()
                self.present(currencyVC, animated: true)
            default:
                return 
            }
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 30
        case 1:
            return 30
        case 2:
            return 30
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
            
        case 0:
            let headerView = UIView()
            let headerLabel: UILabel = {
                let label = UILabel()
                label.textColor = .white
                label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
                label.text = "Settings"
                
                return label
                
            }()
            headerLabel.frame = .init(x: 0, y: 0, width: self.view.frame.width, height: 30)
            headerView.addSubview(headerLabel)
//            headerView.snp.makeConstraints{
//                $0.width.equalTo(UIScreen.main.bounds.width).inset(-10)
//                $0.height.equalTo(UIScreen.main.bounds.height).inset()
//            }
//            headerLabel.snp.makeConstraints{
//                $0.trailing.equalToSuperview().inset(15)
//                $0.leading.equalToSuperview().inset(15)
//                $0.width.height.equalToSuperview().inset(-10)
//            }

            return headerView
        case 1:
            let headerView = UIView()
            let headerLabel: UILabel = {
                let label = UILabel()
                label.textColor = .white
                label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
                label.text = "Help"
                
                return label
                
            }()
            headerLabel.frame = .init(x: 0, y: 0, width: self.view.frame.width, height: 30)
            headerView.addSubview(headerLabel)
            
            return headerView
            
        case 2:
            let headerView = UIView()
            let headerLabel: UILabel = {
                let label = UILabel()
                label.textColor = .white
                label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
                label.text = "Book faster"
                
                return label
                
            }()
            headerLabel.frame = .init(x: 0, y: 0, width: self.view.frame.width, height: 30)
            headerView.addSubview(headerLabel)
            
            return headerView
            
        default:
           let headerView = UIView()
            headerView.backgroundColor = .orange
            return headerView
        }
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        switch indexPath.row{
        case indexPath.row:
            tableView.cellForRow(at: indexPath)?.backgroundColor = .white
        default:
            return nil
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = settingsTable.dequeueReusableCell(withIdentifier: settingsIdentifier)
            var listConfiguration = cell?.defaultContentConfiguration()
            var backgroundConfiguration = cell?.defaultBackgroundConfiguration()
            
            backgroundConfiguration?.backgroundColor = .white
            
            listConfiguration?.textProperties.color = .black
            cell?.accessoryType = .detailDisclosureButton
            cell?.backgroundColor = .white
            cell?.tintColor = .white
            
            switch indexPath.row {
            case 0:
                listConfiguration?.text = "Currency"
            case 1:
                listConfiguration?.text = "Prices"
            case 2:
                listConfiguration?.text = "Privacy"
            default:
                listConfiguration?.text = ""
            }
            
            guard let cell = cell else {return UITableViewCell()}
            cell.contentConfiguration = listConfiguration
            cell.backgroundConfiguration = backgroundConfiguration
            
            return cell
        case 1:
            let cell = settingsTable.dequeueReusableCell(withIdentifier: settingsIdentifier)
            cell?.accessoryType = .detailDisclosureButton
            cell?.backgroundColor = .white
            cell?.textLabel?.textColor = .systemBlue
            cell?.tintColor = cell?.backgroundColor
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            switch indexPath.row{
            case 0:
                cell?.textLabel?.text = "Other topics"
            default:
                cell?.textLabel?.text = ""
            }
            guard let cell = cell else {
                return UITableViewCell()
            }
            return cell
        case 2:
            guard let cell = settingsTable.dequeueReusableCell(withIdentifier: BookFasterCell.identifier) as? BookFasterCell else{return UITableViewCell()}
                
            return cell
        default:
            let cell = settingsTable.dequeueReusableCell(withIdentifier: settingsIdentifier)
            cell?.backgroundColor = settingsTable.backgroundColor
            cell?.textLabel?.text = "Nothing there yet"
            
            guard let cell = cell else{ return UITableViewCell() }
            return cell
        }
    }
    
}
