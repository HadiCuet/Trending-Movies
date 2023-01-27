//
//  SceneDelegate.swift
//  Trending Movies
//
//  Created by Abdullah Al Hadi on 27/1/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        self.window = UIWindow(windowScene: windowScene)

        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let homeViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
            return
        }
        let navController = UINavigationController(rootViewController: homeViewController)

        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
    }
}

