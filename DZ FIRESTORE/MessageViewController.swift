import Foundation
import UIKit

class MessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var messages = [Chat](){
        didSet {
            tableView.reloadData()
        }
    }
    
    let manager = FirebaseManager.shared

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MessagesTableViewCell.self, forCellReuseIdentifier: MessagesTableViewCell.cellIdentifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(tableView)
        view = tableView
//        tableView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
        
        manager.listenToChat { chat in
            self.messages = chat
        }
        
        
    }
    
    func printSomething() {
        print("jskfd")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessagesTableViewCell.cellIdentifier, for: indexPath) as? MessagesTableViewCell else { return UITableViewCell() }
//        cell.readAction = printSomething
        cell.readAction = {
//            print("skfjsdlfk")
            self.manager.readMessage(self.messages[indexPath.row])
        }
        cell.configure(messages[indexPath.row])
                return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ViewController()
        vc.didAppearAction = { number in
            print("\(number) + \(indexPath.row)")
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
