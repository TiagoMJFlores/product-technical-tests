//
//  SceneDelegate.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var boutiqueListCoordinator: BoutiqueListCoordinator?

    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        let navigationController = UINavigationController()
        boutiqueListCoordinator = BoutiqueListCoordinator(navigationController: navigationController)
        window?.rootViewController = navigationController
        boutiqueListCoordinator?.start()
        window?.makeKeyAndVisible()
    }



}

