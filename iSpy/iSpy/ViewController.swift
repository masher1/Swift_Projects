//
//  ViewController.swift
//  iSpy
//
//  Created by Malkiel Asher on 4/8/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var rose: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        scrollView.delegate = self
        updateZoomFor(size: scrollView.bounds.size)
        
        //viewForZooming?(in: scrollView)
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return rose
    }
    
    func updateZoomFor(size: CGSize){
        let widthScale = size.width / rose.bounds.width
        let heightScale = size.height / rose.bounds.height
        let scale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = scale
    }
    
}


