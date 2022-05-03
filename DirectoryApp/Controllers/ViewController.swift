//
//  ViewController.swift
//  DirectoryApp
//
//  Created by admin on 03/05/2022.
//

import UIKit

class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let peopleVC = PeopleVC()
        let roomVC = RoomVC()
        
        peopleVC.title = "People"
        roomVC.title = "Rooms"
        
        self.setViewControllers([peopleVC, roomVC], animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        let images = ["house", "star"]
        
//        for i in 0...2 {
//            items[i].image = UIImage(systemName: images[i])
//        }
//
        self.tabBar.tintColor = .black
        
    }
    
}

//class PeopleVC: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//
//    }
//
//}

//class RoomsVC: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//
//    }
//
//}
//


/*
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        
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

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = "userId: \(self.models[indexPath.row].id)"
        return cell
    }
    
    
}
*/
