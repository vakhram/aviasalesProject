//
//  APIViewController.swift
//  testproject1
//
//  Created by Guest Acc on 10.04.2024.
//

import UIKit

class APIViewController: UIViewController {

    enum TableSection {
        case main
        case second
    }
    
    lazy var apiTable = UITableView()
    let identifier = "apiIdentifier"
    let apiManager = NetworkManager(with: .default)
    var dataSource: UITableViewDiffableDataSource<TableSection, Cat>?
    var cats: [Cat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .purple
        refreshData()
        setupTable()
    }
    
    private func setupTable() {
        
        apiTable = .init(frame: view.bounds, style: .plain)
        apiTable.register(APICell.self, forCellReuseIdentifier: APICell.identifier)
        apiTable.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        apiTable.separatorStyle = .singleLine
        apiTable.dataSource = self
        apiTable.delegate = self
        apiTable.backgroundColor = .lightGray
        
        view.addSubview(apiTable)
    }
    private func refreshData() {
        Task {
            do {
                cats = try await apiManager.obtainCats()
                apiTable.reloadData()
            }
            catch {
                print("There is an error of type: \(error.localizedDescription)")
            }
        }
    }
}

extension APIViewController: ApiCellDelegate{
    func detailButtonTapped() {
        let alert = UIAlertController(title: "This is ", message: "cat", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(confirmAction)
        
        present(alert,animated: true)
    }
}
extension APIViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = apiTable.dequeueReusableCell(withIdentifier: APICell.identifier) as? APICell else { return UITableViewCell() }

        let item = cats[indexPath.row]
        cell.configure(with: item)
        cell.backgroundColor = apiTable.backgroundColor
        cell.delegate = self

        return cell
    }

}
