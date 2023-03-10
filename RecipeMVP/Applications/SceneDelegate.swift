//
//  SceneDelegate.swift
//  RecipeMVP
//
//  Created by user on 09.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        let assembly = AssemblyBuilder()
        let router = Router(navigationController: navigationController, assemblyBuilder: assembly)
        router.setupTabBar()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
