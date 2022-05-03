//
//  RoomViewController.swift
//  DirectoryApp
//
//  Created by admin on 03/05/2022.
//

import UIKit

class RoomVC: UIViewController {
    private let networkCaller: NetworkCaller = NetworkManager()
    private var rModels: [Rooms] = [] {
        didSet {
            DispatchQueue.main.async {
                self.mytable.reloadData()
            }
        }
    }
    
    lazy var mytable: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
        view.backgroundColor = .white
        self.networkCaller.getModel(urlStr: "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/rooms") { [weak self] (result: Result<[Rooms], Error>) in
            switch result {
            case .success(let roomModels):
                self?.rModels = roomModels
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func setUpUI() {
        self.view.addSubview(self.mytable)
        self.mytable.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.mytable.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.mytable.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.mytable.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
    }
    

}

extension RoomVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = "Id: \(self.rModels[indexPath.row].id)"
        return cell
    }
}
