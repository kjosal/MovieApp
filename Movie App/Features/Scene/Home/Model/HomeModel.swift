//
//  HomeModel.swift
//  Movie App
//
//  Created by Kevin Josal on 16/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import Foundation

public class HomeModel: HomeControllerToModel {
    var controller: HomeModelToController?
    
    func requestMovieData(endpoint: String, page: Int) {
        let requestMovie = APIGetMovieList(endpoint: endpoint, page: page)
        requestMovie.requestMovieList(completionHandler: { result in
            DispatchQueue.main.async {
                self.controller?.didGetMovieData(response: result)
            }
        })
    }
}
