//
//  APIService.swift
//  PhotoJournal
//
//  Created by Eunbee Kang on 2023/08/30.
//

import Foundation

class APIService {
    
    private init() { }
    
    static let shared = APIService()
    
    func callRequest() {
        
        guard let url = URL(string: "https://apod.nasa.gov/apod/image/2308/M66_JwstTomlinson_3521.jpg") else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data {
                print(data)
                let value = String(data: data, encoding: .utf8)
                print(value)
            }
            
            print(response)
            print(error)
        }.resume()
        
        
    }
}
