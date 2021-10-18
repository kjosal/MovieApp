//
//  ReviewDataModel.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import Foundation

public struct ReviewData {
    var data : [MovieReview] = []
    
    init() {}
    
    mutating func addData(data: [MovieReview]) {
        self.data.append(contentsOf: data)
    }
    
    mutating func clearData(){
        self.data.removeAll()
    }
}
