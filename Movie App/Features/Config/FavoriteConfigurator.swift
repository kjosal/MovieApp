//
//  FavoriteConfigurator.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import UIKit

public class FavoriteConfigurator: UIViewController {
    public static var shared = FavoriteConfigurator()

    public func createFavoriteView() -> UIViewController {
        let view: UIViewController & FavoriteControllerToView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FavoriteView") as! FavoriteView
        let controller: FavoriteViewToController = FavoriteController()

        view.controller     = controller
        controller.view     = view

        return view
    }
}
