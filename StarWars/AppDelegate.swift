//
//  AppDelegate.swift
//  StarWars
//
//  Created by Matthew Delves on 25/6/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let filmsViewController = FilmsTableViewController(viewModel: FilmsViewModel())
        let navController = UINavigationController(rootViewController: filmsViewController)

        window = UIWindow()
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        configureAppearance(of: navController)

        return true
    }

    func configureAppearance(of navController: UINavigationController) {
//        navController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        navController.navigationBar.shadowImage = UIImage()
//        navController.navigationBar.isTranslucent = false
        navController.navigationBar.barTintColor = .black
        navController.navigationBar.tintColor = .white
        navController.navigationBar.backgroundColor = .black

        guard let font = UIFont(name: "Starjedi", size: 24) else { return }

        let attrs = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: font
        ]

        UINavigationBar.appearance().titleTextAttributes = attrs
    }
}

