//
//  WelcomeViewController.swift
//  GoFit
//
//  Created by Sanzhar Koshkarbayev on 06.06.2022.
//

import UIKit

final class WelcomeViewController: UIViewController {
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        setUpObjects()
    }
    
    private func setUpObjects(){
        taglineLabel.textColor = ColorPalette.gray1
        xLabel.textColor = setGradientLayer(
            color1: ColorPalette.logo_linear1,
            color2: ColorPalette.logo_linear2,
            bounds: xLabel.bounds
        )
    }


}

