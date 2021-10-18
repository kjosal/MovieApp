//
//  HomeConfigurator.swift
//  Movie App
//
//  Created by Kevin Josal on 16/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import UIKit

public class HomeConfigurator: UIViewController {
    public static var shared = HomeConfigurator()

    public func createHomeView() -> UIViewController {
        let view: UIViewController & HomeControllerToView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeView") as! HomeView
        let controller: HomeViewToController & HomeModelToController = HomeController()
        let model: HomeControllerToModel = HomeModel()

        view.controller     = controller
        controller.view     = view
        controller.model    = model
        model.controller    = controller

        return view
    }
}
