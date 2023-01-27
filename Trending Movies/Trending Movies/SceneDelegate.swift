//
//  SceneDelegate.swift
//  Trending Movies
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        self.window = UIWindow(windowScene: windowScene)
        let rootVCId = "HomeViewController"

        let mainStoryboard = UIStoryboard(name: mainStoryboard, bundle: nil)
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

