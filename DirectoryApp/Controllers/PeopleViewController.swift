//
//  PeopleViewController.swift
//  DirectoryApp
//
//  Created by admin on 03/05/2022.
//

import UIKit

class PeopleVC: UIViewController {

    lazy var table: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    

    private let networkCaller: NetworkCaller = NetworkManager()
    private var models: [People] = [] {
        didSet {
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        view.backgroundColor = .white
        self.networkCaller.getModel(urlStr: "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/people") { [weak self] (result: Result<[People], Error>) in
            switch result {
            case .success(let models):
                self?.models = models
            case .failure(let error):
                print(error)
            }
        }
       
    }
    

    private func setUpUI() {
        self.view.addSubview(self.table)
        self.table.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.table.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.table.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.table.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
    }

}
extension PeopleVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "userId: \(self.models[indexPath.row].id)"
        return cell
    }
}
