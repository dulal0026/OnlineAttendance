//
//  StoresVC.swift
//  Online Attendance
//
//  Created by user on 19/9/22.
//

import UIKit

class StoresVC: UITableViewController {
    var storeListVM:StoreListViewModel = StoreListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        self.title = "Stores"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "StoreCell")
        self.tableView.tableFooterView = UIView()
        getStores()
    }
    func getStores()  {
         
        WebService().load(resource: StoreList.all) {[weak self] (result) in
        
            switch result{
            case .success(let storeList):
                DispatchQueue.main.async {
                    self?.storeListVM.storesViewModel = storeList.data.map({ StoreViewModel(store: $0)})
                    self?.tableView.reloadData()
                }
            case .failure(let error):
            print(error.localizedDescription)
            }
        }
    }
}

extension StoresVC{
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeListVM.numberOfStores()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "StoreCell")
        let storeViewModel = storeListVM.storeViewModel(at: indexPath.row)
        cell.textLabel?.text = storeViewModel.name
        cell.detailTextLabel?.text = storeViewModel.address
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storeVM = storeListVM.storeViewModel(at: indexPath.row)
        let vc:StoreDetailsVC = StoreDetailsVC(viewModel: storeVM)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
