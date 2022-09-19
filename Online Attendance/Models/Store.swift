//
//  Store.swift
//  Online Attendance
//
//  Created by user on 19/9/22.
//

import Foundation


class StoreList:Codable {
    var data:[Store] = []
}
struct Store:Codable{
    let id:Int
    let name:String
    let address:String
}
extension StoreList {
    static var all:Resource<StoreList> = {
        guard let url:URL = URL(string: "http://128.199.215.102:4040/api/stores") else {
            fatalError("Invalid Url")
        }
        return Resource(url: url)
    }()
}
