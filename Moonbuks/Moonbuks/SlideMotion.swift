//
//  SlideMotion.swift
//  Moonbuks
//
//  Created by Daye on 2021/05/26.
//

import UIKit

class SlideMotion: UITabBarController, UITabBarControllerDelegate {

     
    // Swipe Gesture Recognizer!!
    override func viewDidLoad() {
        super.viewDidLoad()
            
        delegate = self
            
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
            swipeRight.direction = .right
            self.view.addGestureRecognizer(swipeRight)
            
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
            swipeLeft.direction = .left
            self.view.addGestureRecognizer(swipeLeft)
     
            // Do any additional setup after loading the view.
        }
     
     
    @objc func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {

            if gesture.direction == .left {
                if (self.selectedIndex) < 4 {// 슬라이드할 탭바 갯수 지정 (전체 탭바 갯수 - 1)
                    animateToTab(toIndex: self.selectedIndex+1)
                }
            } else if gesture.direction == .right {
                if (self.selectedIndex) > 0 {
                    animateToTab(toIndex: self.selectedIndex-1)
                }
            }
        }
    }
     
    extension MainViewController: UITabBarControllerDelegate  {
        func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            guard let tabViewControllers = tabBarController.viewControllers, let toIndex = tabViewControllers.firstIndex(of: viewController) else {
                return false
            }
            animateToTab(toIndex: toIndex)
            return true
        }
        
    func animateToTab(toIndex: Int) {
            guard let tabViewControllers = viewControllers,
                let selectedVC = selectedViewController else { return }
            
            guard let fromView = selectedVC.view,
                let toView = tabViewControllers[toIndex].view,
                let fromIndex = tabViewControllers.firstIndex(of: selectedVC),
                fromIndex != toIndex else { return }
            
            
            // Add the toView to the tab bar view
            fromView.superview?.addSubview(toView)
            
            // Position toView off screen (to the left/right of fromView)
            let screenWidth = UIScreen.main.bounds.size.width
            let scrollRight = toIndex > fromIndex
            let offset = (scrollRight ? screenWidth : -screenWidth)
            toView.center = CGPoint(x: fromView.center.x + offset, y: toView.center.y)
            
            // Disable interaction during animation
            view.isUserInteractionEnabled = false
            
            UIView.animate(withDuration: 0.3,
                           delay: 0.0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 0,
                           options: .curveEaseOut,
                           animations: {
                            // Slide the views by -offset
                            fromView.center = CGPoint(x: fromView.center.x - offset, y: fromView.center.y)
                            toView.center = CGPoint(x: toView.center.x - offset, y: toView.center.y)
                            
            }, completion: { finished in
                // Remove the old view from the tabbar view.
                fromView.removeFromSuperview()
                self.selectedIndex = toIndex
                self.view.isUserInteractionEnabled = true
            })
        }
    }
  

