//
//  ViewController.swift
//  Ind02_Olaifa_Julius
//
//  Created by Julius Olaifa on 2/10/22.
//

import UIKit

class ViewController: UIViewController {
    var images: [[UIImage?]] =
    [[UIImage(named: "cell00.png"), UIImage(named: "cell01.png"), UIImage(named: "cell02.png"), UIImage(named: "cell03.png")],
     [UIImage(named: "cell10.png"), UIImage(named: "cell11.png"), UIImage(named: "cell12.png"), UIImage(named: "cell13.png")],
     [UIImage(named: "cell20.png"), UIImage(named: "cell21.png"), UIImage(named: "cell22.png"), UIImage(named: "cell23.png")],
     [UIImage(named: "cell30.png"), UIImage(named: "cell31.png"), UIImage(named: "cell32.png"), UIImage(named: "cell33.png")],
     [UIImage(named: "cell40.png"), UIImage(named: "cell41.png"), UIImage(named: "cell42.png"), UIImage(named: "cell43.png")]
     ]

    @IBOutlet weak var cell00: UIImageView!
    @IBOutlet weak var cell01: UIImageView!
    @IBOutlet weak var cell02: UIImageView!
    @IBOutlet weak var cell03: UIImageView!
    @IBOutlet weak var cell10: UIImageView!
    @IBOutlet weak var cell11: UIImageView!
    @IBOutlet weak var cell12: UIImageView!
    @IBOutlet weak var cell13: UIImageView!
    @IBOutlet weak var cell20: UIImageView!
    @IBOutlet weak var cell21: UIImageView!
    @IBOutlet weak var cell22: UIImageView!
    @IBOutlet weak var cell23: UIImageView!
    @IBOutlet weak var cell30: UIImageView!
    @IBOutlet weak var cell31: UIImageView!
    @IBOutlet weak var cell32: UIImageView!
    @IBOutlet weak var cell33: UIImageView!
    @IBOutlet weak var cell40: UIImageView!
    @IBOutlet weak var cell41: UIImageView!
    @IBOutlet weak var cell42: UIImageView!
    @IBOutlet weak var cell43: UIImageView!
    
    @IBOutlet weak var showAnswerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        correctDisplay()
    }
    
    func correctDisplay() {
        cell00.image = UIImage(named: "cell00.png")
        cell01.image = UIImage(named: "cell01.png")
        cell02.image = UIImage(named: "cell02.png")
        cell03.image = UIImage(named: "cell03.png")
        cell10.image = UIImage(named: "cell10.png")
        cell11.image = UIImage(named: "cell11.png")
        cell12.image = UIImage(named: "cell12.png")
        cell13.image = UIImage(named: "cell13.png")
        cell20.image = UIImage(named: "cell20.png")
        cell21.image = UIImage(named: "cell21.png")
        cell22.image = UIImage(named: "cell22.png")
        cell23.image = UIImage(named: "cell23.png")
        cell30.image = UIImage(named: "cell30.png")
        cell31.image = UIImage(named: "cell31.png")
        cell32.image = UIImage(named: "cell32.png")
        cell33.image = UIImage(named: "cell33.png")
        cell40.image = UIImage(named: "cell40.png")
        cell41.image = UIImage(named: "cell41.png")
        cell42.image = UIImage(named: "cell42.png")
        cell43.image = UIImage(named: "cell43.png")
    }
    
    func gameState() {
        cell00.image = images[0][0]
        cell01.image = images[0][1]
        cell02.image = images[0][2]
        cell03.image = images[0][3]
        cell10.image = images[1][0]
        cell11.image = images[1][1]
        cell12.image = images[1][2]
        cell13.image = images[1][3]
        cell20.image = images[2][0]
        cell21.image = images[2][1]
        cell22.image = images[2][2]
        cell23.image = images[2][3]
        cell30.image = images[3][0]
        cell31.image = images[3][1]
        cell32.image = images[3][2]
        cell33.image = images[3][3]
        cell40.image = images[4][0]
        cell41.image = images[4][3]
        cell42.image = images[4][3]
        cell43.image = images[4][3]
    }

    @IBAction func showAnswer(_ sender: Any) {
        if showAnswerButton.titleLabel?.text == "Show Answer" {
            correctDisplay()
            showAnswerButton.setTitle("Hide Answer", for: .normal)
        } else {
            showAnswerButton.setTitle("Show Answer", for: .normal)
            gameState()
        }

    }
    
}


