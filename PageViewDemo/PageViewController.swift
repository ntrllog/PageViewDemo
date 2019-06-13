//
//  PageViewController.swift
//  PageViewDemo
//
//  Created by Alan Lam on 6/9/19.
//  Copyright © 2019 ntrllog. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = controllerArray!.firstIndex(of: viewController) else {
            return nil
        }
        
        let preIndex = vcIndex - 1
        
        guard preIndex >= 0 else {
            return controllerArray!.last // loops back to end
        }
        
        guard controllerArray!.count > preIndex else {
            return nil
        }
        
        return controllerArray![preIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = controllerArray!.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = vcIndex + 1
        
        guard controllerArray!.count != nextIndex else {
            return controllerArray!.first // loops back to beginning
        }
        
        guard controllerArray!.count > nextIndex else {
            return nil
        }
        
        return controllerArray![nextIndex]
    }
    
    var controllerArray: [UIViewController]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataSource = self
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let firstVC = storyBoard.instantiateViewController(withIdentifier: "page01")
        let secondVC = storyBoard.instantiateViewController(withIdentifier: "page02")
        let thirdVC = storyBoard.instantiateViewController(withIdentifier: "page03")
        
        controllerArray = [firstVC, secondVC, thirdVC]
        
        self.setViewControllers([controllerArray![0]], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
