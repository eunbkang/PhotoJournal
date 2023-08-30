//
//  URL+Extension.swift
//  PhotoJournal
//
//  Created by Eunbee Kang on 2023/08/30.
//

import Foundation

extension URL {
    static let unsplashBaseUrl = "https://api.unsplash.com/"
    
    static func makeSearchUrl() -> String {
        return unsplashBaseUrl + "search/photos"
    }
}
