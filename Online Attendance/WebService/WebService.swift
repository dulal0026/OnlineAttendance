//
//  WebService.swift
//  Online Attendance
//
//  Created by user on 19/9/22.
//

import Foundation

enum NetworkError:Error {
    case decodingError
    case domainError
    case urlError
}
enum HTTPMethod:String {
    case get = "GET"
    case post = "POST"
}
struct Resource<T:Codable> {
    let url:URL
    var httpMethod:HTTPMethod = .get
    var body:Data? = nil
}

extension Resource{
    init(url:URL) {
        self.url = url
    }
}

protocol Service {
    func load<T>(resource:Resource<T>,completion: @escaping((Result<T,NetworkError>)->Void))
}

class WebService: Service {
    func load<T>(resource:Resource<T>,completion: @escaping((Result<T,NetworkError>)->Void)){
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            print(data)
            
            let result = try? JSONDecoder().decode(T.self,from:data)
            if let result = result {
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            }
            else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
