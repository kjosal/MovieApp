//
//  DetailConfigurator.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import UIKit

public class DetailConfigurator: UIViewController {
    public static var shared = DetailConfigurator()

    func createDetailView(previousPage: RefreshPreviousPageControllerToController?, id: Int, title: String) -> UIViewController {
        let view: UIViewController & DetailControllerToView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailView") as! DetailView
        let controller: DetailViewToController & DetailModelToController = DetailController()
        let model: DetailControllerToModel = DetailModel()

        view.controller         = controller
        controller.view         = view
        controller.model        = model
        controller.previousPage = previousPage
        controller.id           = id
        controller.title        = title
        model.controller        = controller

        return view
    }
}
