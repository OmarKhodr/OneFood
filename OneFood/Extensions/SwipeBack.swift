//
//  NavigationController+SwipeBack.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 02/12/2025.
//

import UIKit

extension UINavigationController: @retroactive UIGestureRecognizerDelegate {

    open override func viewDidLoad() {
        super.viewDidLoad()

        // Enable full-screen swipe
        let fullScreenGesture = UIPanGestureRecognizer(target: interactivePopGestureRecognizer?.delegate,
                                                       action: Selector(("handleNavigationTransition:")))
        fullScreenGesture.delegate = self
        view.addGestureRecognizer(fullScreenGesture)

        // Disable the original edge-only gesture
        interactivePopGestureRecognizer?.isEnabled = false
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
