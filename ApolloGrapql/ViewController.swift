//
//  ViewController.swift
//  ApolloGrapql
//
//  Created by topik mujianto on 21/02/20.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import Apollo

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate var data: [GetNearBtsQuery.Data.SearchTowerNearUser] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        print("fetching data...")
        NetworkManager.shared.appolo.fetch(query: GetNearBtsQuery(distance: 10, lat: "13.4699", long: "144.804", limit: 10)) { [weak self] result in
            guard let `self` = self else {return}
            switch result {
            case .success(let response):
                self.data = response.data?.searchTowerNearUser ?? []
                self.tableView.reloadData()
            case .failure(let error):
                let alert = UIAlertController(title: "", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

//MARK:- UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BTS_CELL")
        let nearBTS = self.data[indexPath.row]
        cell?.textLabel?.text = "\(nearBTS.filenum ?? "") (lat: \(nearBTS.latitude), long: \(nearBTS.longitude)"
        return cell!
    }
}
