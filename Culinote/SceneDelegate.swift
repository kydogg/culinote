//
//  SceneDelegate.swift
//  Culinote
//
//  Created by Kyle D. Baker on 10/13/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        // Ensure the scene is a UIWindowScene
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)

        let tabBarController = UITabBarController()

        // MARK: - Recipes Tab
        let recipesNavController = UINavigationController(rootViewController: RecipeListVC())
        recipesNavController.tabBarItem = UITabBarItem(
            title: "Recipes",
            image: SFSymbols.recipes,
            tag: 0
        )

        // MARK: - Favorites Tab
        let favoritesNavController = UINavigationController(rootViewController: FavoritesVC())
        favoritesNavController.tabBarItem = UITabBarItem(
            title: "Favorites",
            image: SFSymbols.favorites,
            tag: 1
        )

        // MARK: - Notes Tab
        let notesNavController = UINavigationController(rootViewController: NotesVC())
        notesNavController.tabBarItem = UITabBarItem(
            title: "Notes",
            image: SFSymbols.notes,
            tag: 2
        )

        
        // MARK: - Store Tab
        let storeNavController = UINavigationController(rootViewController: StoreVC())
        storeNavController.tabBarItem = UITabBarItem(
            title: "Store",
            image: SFSymbols.store,
            tag: 3
        )

        // MARK: - Profile Tab
        let profileNavController = UINavigationController(rootViewController: ProfileVC())
        profileNavController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: SFSymbols.profile,
            tag: 4
        )

        // Add all view controllers to the tab bar
        tabBarController.viewControllers = [recipesNavController, favoritesNavController, notesNavController, storeNavController, profileNavController]

        // Set the root view controller to the tab bar controller
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
