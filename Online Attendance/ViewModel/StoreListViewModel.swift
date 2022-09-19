//
//  StoreListViewModel.swift
//  Online Attendance
//
//  Created by user on 19/9/22.
//

import Foundation
struct StoreListViewModel {
    var storesViewModel:[StoreViewModel] = []
    init() {
        self.storesViewModel = []
    }
}

extension StoreListViewModel{
    func numberOfStores() -> Int {
        return storesViewModel.count
    }
    func storeViewModel(at index:Int) -> StoreViewModel {
        return storesViewModel[index]
    }
}
