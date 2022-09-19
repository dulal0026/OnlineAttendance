//
//  StoreViewModel.swift
//  Online Attendance
//
//  Created by user on 19/9/22.
//

import Foundation

struct StoreViewModel {
    let store:Store
}

extension StoreViewModel{
    var name:String{
        return store.name
    }
    var address:String {
        return store.address
    }
}
