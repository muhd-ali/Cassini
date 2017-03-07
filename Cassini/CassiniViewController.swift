//
//  CassiniViewController.swift
//  Cassini
//
//  Created by muaz hamza on 2017-03-06.
//  Copyright © 2017 PRO. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {
    
    let imageURLS = [
        "image1" : "http://www.uniwallpaper.com/static/images/eiffel-tower-wallpaper-18_fRZLW4V.jpg",
        "image2" : "http://www.planwallpaper.com/static/images/2022725-wallpaper_625864_Iz6NK8G.jpg",
        "image3" : "colorfulBackground.jpg",
    ]
    
    func getURL(imageName: String?) -> NSURL? {
        if let key = imageName {
            if let url = imageURLS[key] {
                return NSURL(string: url)
            }
        }
        
        return nil
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Image" {
            if let ivc = segue.destination.contentViewController as? ImageViewController {
                let imageName = (sender as? UIButton)?.currentTitle
                ivc.imageURLToLoad = getURL(imageName: imageName)
                ivc.title = imageName
            }
        }
    }

}

extension UIViewController {
    var contentViewController: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}
