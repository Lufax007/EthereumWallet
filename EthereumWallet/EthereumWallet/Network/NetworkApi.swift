//
//  NetworkApi.swift
//  EthereumWallet
//
//  Created by Nancy T on 2022/7/25.
//

import Foundation

class NetworkApi {
    static func get<T: Codable>(_ url:URL, _ params:[String:Any]?, _ type: T.Type, completion:@escaping (_ data: T?, _ error: Error?)->Void) {
        DispatchQueue.global().async {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) {  data, response, error in
                guard error == nil, let data = data else {
                    completion(nil, error)
                    return
                }
                let jsonDecoder = JSONDecoder()
                do {
                    let datas = try jsonDecoder.decode(type, from: data)
                    DispatchQueue.main.async {
                        completion(datas, nil)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
                
            }.resume()
        }
    }
}
