//
//  SplashAnimationVC.swift
//  SysmindProject
//
//  Created by Mohd Maruf on 10/12/20.
//  Copyright © 2020 Deepam. All rights reserved.
//

import UIKit

class SplashAnimationVC: UIViewController {
    
    // MARK: - Outlets
    
    // UIImageView to show the UIImageView with animation
    @IBOutlet weak var imageViewSplash: UIImageView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewSplash.alpha = 1
        UIView.animate(withDuration: 4, delay: 0, options: UIView.AnimationOptions.transitionFlipFromLeft, animations: { () -> Void in
            self.imageViewSplash.alpha = 0
        }, completion: { (Bool) -> Void in
            let storyBoard : UIStoryboard = UIStoryboard(name: Storyboard.Main.rawValue, bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "MarvelThemeVC") as! MarvelThemeVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        )
    }
}
