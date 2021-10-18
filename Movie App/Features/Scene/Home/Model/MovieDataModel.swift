//
//  MovieDataModel.swift
//  Movie App
//
//  Created by Kevin Josal on 17/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import Foundation

public struct MovieData {
    var data        : [Movie] = []
    var category    : Category = .popular
    
    init() {}
    
    mutating func changeCategory(category: Category) {
        self.category = category
    }
    
    mutating func addData(data: [Movie]) {
        self.data.append(contentsOf: data)
    }
    
    mutating func clearData(){
        self.data.removeAll()
    }
}
