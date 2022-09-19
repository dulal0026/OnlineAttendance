//
//  StoreDetailsVC.swift
//  Online Attendance
//
//  Created by user on 19/9/22.
//

import UIKit

class StoreDetailsVC: UIViewController {

    var viewModel:StoreViewModel
    
    init(viewModel: StoreViewModel)
    {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var addressLabel:UILabel = {
        let label:UILabel = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.black
        label.backgroundColor = .clear
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(addressLabel)
        setupControls()
        self.title = viewModel.name
        fill(viewModel)
    }
    func setupControls()  {
        addressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        addressLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        addressLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
    }
    
    func fill(_ vm:StoreViewModel)  {
        addressLabel.text = vm.address
    }
    
}
