//
//  UnsplashManager.swift
//  PhotoJournal
//
//  Created by Eunbee Kang on 2023/08/30.
//

import Foundation

class UnsplashManager {
    
    static let shared = UnsplashManager()
    private init() { }
    
    let header = ["Authorization": "Client-ID \(APIKey.unsplash)"]
    
    func callSearchRequest(query: String, completion: @escaping ([Photo]) -> ()) {
        let urlString = URL.makeSearchUrl() + "?query=\(query)"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = header
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { data, response, error in
            if let data {
                do {
                    print(data)
                    let result = try JSONDecoder().decode(SearchedPhotos.self, from: data)
                    completion(result.results)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
