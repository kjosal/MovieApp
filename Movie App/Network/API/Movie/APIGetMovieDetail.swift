//
//  APIGetMovieDetail.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import Foundation

struct APIGetMovieDetail {
    let resourceURL: URL
    
    init(id: Int) {
        let resourceString = MAPI.baseLink.rawValue + String(id) + MAPI.apiKey.rawValue
        guard let resourceURL = URL(string: resourceString) else {fatalError()}

        self.resourceURL = resourceURL
    }
    
    func requestMovieDetail(completionHandler: @escaping (MovieDetailResponse) -> Void) {
        let task = URLSession.shared.dataTask(with: resourceURL, completionHandler:  { (data, response, error) in
            if let error = error {
                print("Error with fetching data: \(error)")
                return
            }
            
            if let data = data,
                let movieList = try? JSONDecoder().decode(MovieDetailResponse.self, from: data) {
                completionHandler(movieList)
            }
            else {
                print("Somethings wrong when parsing data")
            }
        })
        task.resume()
    }
}
