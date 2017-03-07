//
//  ImageViewController.swift
//  Cassini
//
//  Created by muaz hamza on 2017-03-06.
//  Copyright © 2017 PRO. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    var imageURLToLoad: NSURL?
    private var imageURL: NSURL? {
        didSet {
            image = nil
            fetchImage()
        }
    }
    
    private func fetchImage() {
        if let url = imageURL {
            if let imageData = NSData(contentsOf: url as URL) {
                image = UIImage(data: imageData as Data)
            }
        }
    }
    

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize = imageView.frame.size
        }
    }
    
    var image: UIImage? {
        get {
            return imageView.image
        }
        
        set {
            imageView?.image = newValue
            imageView?.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageURL = imageURLToLoad
        scrollView.addSubview(imageView)
    }
}
