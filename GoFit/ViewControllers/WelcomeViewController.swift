//
//  WelcomeViewController.swift
//  GoFit
//
//  Created by Sanzhar Koshkarbayev on 06.06.2022.
//

import UIKit

final class WelcomeViewController: UIViewController {
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
        startButton.layer.cornerRadius = startButton.frame.width/10.0
    }


}

