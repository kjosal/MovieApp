//
//  APIGetMovieList.swift
//  Movie App
//
//  Created by Kevin Josal on 17/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import Foundation

struct APIGetMovieList {
    let resourceURL: URL
    
    init(endpoint: String, page: Int) {
        let resourceString = MAPI.baseLink.rawValue + endpoint + MAPI.apiKey.rawValue + MAPI.page.rawValue + String(page)
        guard let resourceURL = URL(string: resourceString) else {fatalError()}

        self.resourceURL = resourceURL
    }
    
    func requestMovieList(completionHandler: @escaping (MovieResponse) -> Void) {
        let task = URLSession.shared.dataTask(with: resourceURL, completionHandler:  { (data, response, error) in
            if let error = error {
                print("Error with fetching data: \(error)")
                return
            }
            
            if let data = data,
                let movieList = try? JSONDecoder().decode(MovieResponse.self, from: data) {
                completionHandler(movieList)
            }
            else {
                print("Somethings wrong when parsing data")
            }
        })
        task.resume()
    }
}
