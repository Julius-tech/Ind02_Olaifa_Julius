//
//  ViewController.swift
//  Ind02_Olaifa_Julius
//
//  Created by Julius Olaifa on 2/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    let row = 5
    let col = 4
    
    // the initial empty position on the puzzleBoard
    var emptyPosition = (4, 3)
    
    // A 2-D array of the ImageViews to capture the state of the puzzle
    lazy var imageViews =
                           [[cell00,cell01,cell02,cell03],
                           [cell10,cell11, cell12,cell13],
                           [cell20,cell21,cell22,cell23],
                           [cell30,cell31,cell32,cell33],
                           [cell40,cell41,cell42,cell43]]
    
    // A 2-D array of the ImageFiles name
    var imageFiles =
        [["cell00.png","cell01.png","cell02.png","cell03.png"],
        ["cell10.png","cell11.png", "cell12.png","cell13.png"],
        ["cell20.png","cell21.png","cell22.png","cell23.png"],
        ["cell30.png","cell31.png","cell32.png","cell33.png"],
        ["cell40.png","cell41.png","cell42.png","cell43.png"]]

    
    
    //  IBOUTLETS //
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
    
    @IBOutlet weak var wholeImage: UIImageView!
    
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var showAnswerButton: UIButton!
    
    // Tap Handler for the Imageviews uses ViewPosition function to make legal swaps
    @IBAction func tapHandler(_ sender: UITapGestureRecognizer) {
        let newPosition = ViewPosition(imageView: sender.view!)!
        if (emptyPosition.0 == newPosition.0 && (emptyPosition.1 == newPosition.1+1 || emptyPosition.1 == newPosition.1-1)||emptyPosition.1 == newPosition.1 && (emptyPosition.0 == newPosition.0+1 || emptyPosition.0 == newPosition.0-1)){
            swapImages(imagePosition: newPosition)
            if checkSolved() == true {
                shuffleButton.setTitle("Solved! Shuffle Again?", for: .normal)
                shuffleButton.backgroundColor = .red
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        puzzleState()
    }
    
    // An IBAction for the "Show Answer" Button that displays the game solution
    @IBAction func showAnswer(_ sender: Any) {
        if showAnswerButton.titleLabel?.text == "Show Answer" {
            solvedState()
            showAnswerButton.setTitle("Hide Answer", for: .normal)
        } else {
            showAnswerButton.setTitle("Show Answer", for: .normal)
            puzzleState()
        }

    }
    
    // An IBAction for the "Shuffle" Button that shuffles the puzzle
    @IBAction func shuffle(_ sender: Any) {
        if shuffleButton.titleLabel?.text == "Shuffle" {
            shuffle()
        } else {
            shuffleButton.setTitle("Shuffle", for: .normal)
            shuffleButton.backgroundColor = .systemTeal
        }
    }
    
    // A custom function that handles the shuffle logic using the swapImages function.
    func shuffle() {
        for _ in stride(from: 200, to: 0, by: -1) {
            let numbers = [-1,0,1]
            let direction = (numbers.randomElement()!, numbers.randomElement()!)
            let newPosition: (Int, Int) = (emptyPosition.0 + direction.0, emptyPosition.1 + direction.1)
            if 0 <= newPosition.0 && newPosition.0 < row && 0 <= newPosition.1 && newPosition.1 < col {
                swapImages(imagePosition: newPosition)
            }
        }
    }
    
    // A function that sets the ImageViews to the present position of the images.
    func puzzleState(){
        for i in 0...row-1{
            for j in 0...col-1{
                let image = UIImage(named: imageFiles[i][j])
                imageViews[i][j]?.image = image
            }
        }
    }
    
    // This displays solution to the puzzle.
    func solvedState(){
        for i in 0...row-1{
            for j in 0...col-1{
                let image = UIImage(named: "cell\(i)\(j).png")
                imageViews[i][j]?.image = image
            }
        }
    }
    
    //This returns the position of a View in the 2-D array
    func ViewPosition(imageView: UIView) -> (Int, Int)? {
        for i in 0...row-1{
            for j in 0...col-1{
                if imageView == imageViews[i][j]{
                    return (i, j)
                }
            }
        }
        return nil
    }
    
    // This function swaps the images of the empty position with the image of a view tapped
    func swapImages(imagePosition: (Int, Int)) {
        let tapepedImage = imageViews[imagePosition.0][imagePosition.1]?.image
        let tappedImageFile = imageFiles[imagePosition.0][imagePosition.1]
        imageViews[imagePosition.0][imagePosition.1]?.image = imageViews[emptyPosition.0][emptyPosition.1]?.image
        imageFiles[imagePosition.0][imagePosition.1] = imageFiles[emptyPosition.0][emptyPosition.1]
        imageViews[emptyPosition.0][emptyPosition.1]?.image = tapepedImage
        imageFiles[emptyPosition.0][emptyPosition.1] = tappedImageFile
        emptyPosition = imagePosition
    }
    
    // This function checks if the puzzle is solved and returns a boolean
    func checkSolved() -> Bool{
        for i in 0...row-1{
            for j in 0...col-1{
                if imageFiles[i][j] != "cell\(i)\(j).png" {
                    return false
                }
            }
        }
        return true
    }
}
