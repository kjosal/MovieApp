//
//  DetailModel.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import Foundation

public class DetailModel: DetailControllerToModel {
    var controller: DetailModelToController?
    
    func requestMovieDetail(id: Int) {
        let requestDetail = APIGetMovieDetail(id: id)
        requestDetail.requestMovieDetail(completionHandler: { result in
            DispatchQueue.main.async {
                self.controller?.didGetMovieDetail(response: result)
            }
        })
    }
}
