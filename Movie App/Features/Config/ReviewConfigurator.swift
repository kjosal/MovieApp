//
//  ReviewConfigurator.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import UIKit

public class ReviewConfigurator: UIViewController {
    public static var shared = ReviewConfigurator()

    public func createReviewView(id: Int) -> UIViewController {
        let view: UIViewController & ReviewControllerToView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReviewView") as! ReviewView
        let controller: ReviewViewToController & ReviewModelToController = ReviewController()
        let model: ReviewControllerToModel = ReviewModel()

        view.controller     = controller
        controller.view     = view
        controller.model    = model
        controller.id       = id
        model.controller    = controller

        return view
    }
}
