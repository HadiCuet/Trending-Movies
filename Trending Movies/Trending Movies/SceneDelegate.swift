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
        let storyboardName = "Main"
        let rootVCId = "HomeViewController"

        let mainStoryboard = UIStoryboard(name: storyboardName, bundle: nil)
        let homeViewController = mainStoryboard.instantiateViewController(identifier: rootVCId, creator: { coder in
            let urlSession = URLSession(configuration: .default)
            let service = MovieClientService(urlSession: urlSession, serviceHelper: ClientServiceHelper())
            return HomeViewController(coder: coder, homeViewModel: HomeViewModel(clientService: service))
        })
        let navController = UINavigationController(rootViewController: homeViewController)

        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
    }
}

