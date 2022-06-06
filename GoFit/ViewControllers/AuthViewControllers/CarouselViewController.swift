//
//  CarouselViewController.swift
//  GoFit
//
//  Created by Sanzhar Koshkarbayev on 06.06.2022.
//

import UIKit

final class CarouselViewController: UIViewController {
    
    @IBOutlet weak var circleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        setUpObjects()
    }

    private func setUpObjects(){
        let CIRCLE_RADIUS_VALUE = 2.0
        let circleViewHeigth = circleView.layer.frame.height
        
        circleView.layer.cornerRadius = circleViewHeigth/CIRCLE_RADIUS_VALUE
        
    }
}
