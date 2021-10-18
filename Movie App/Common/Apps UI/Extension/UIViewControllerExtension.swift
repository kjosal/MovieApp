//
//  UIViewControllerExtension.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import UIKit

extension UIViewController {
    func navBarComponent(title: String){
        self.title = title
        self.navigationController?.navigationBar.titleTextAttributes  = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor         = .systemBlue
        self.navigationController?.navigationBar.tintColor            = .white
    }
    
    func navBarWithBackComponent(title: String){
        self.title = title
        self.navigationController?.navigationBar.titleTextAttributes  = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor         = .systemBlue
        self.navigationController?.navigationBar.tintColor            = .white
        navigationItem.leftBarButtonItem    = UIBarButtonItem(image: UIImage(named: "back"), style: .done, target: self, action: #selector(backPressed(sender:)))
    }
    
    @objc func backPressed(sender: UIGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
