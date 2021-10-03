//
//  ReviewViewController.swift
//  Explore-BR
//
//  Created by Ederson on 02/10/21.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var placeTitleLabel: UILabel!
    @IBOutlet weak var placeAddress: UILabel!
    @IBOutlet weak var titleReviewTextField: UITextField!
    @IBOutlet weak var reviewTextView: UITextView!
    
    @IBOutlet weak var starOne: UIButton!
    @IBOutlet weak var starTwo: UIButton!
    @IBOutlet weak var starThree: UIButton!
    @IBOutlet weak var starFour: UIButton!
    @IBOutlet weak var starFive: UIButton!
    
    var placeDetail:PlaceDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func uncheckStars(){
        self.starOne.setBackgroundImage(UIImage(named: "StarImageCinza"), for: .normal)
        self.starTwo.setBackgroundImage(UIImage(named: "StarImageCinza"), for: .normal)
        self.starThree.setBackgroundImage(UIImage(named: "StarImageCinza"), for: .normal)
        self.starFour.setBackgroundImage(UIImage(named: "StarImageCinza"), for: .normal)
        self.starFive.setBackgroundImage(UIImage(named: "StarImageCinza"), for: .normal)
    }
    
    @IBAction func tappedStarOne(_ sender: UIButton) {
        self.uncheckStars()
        self.starOne.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
    }
    
    @IBAction func tappedStarTow(_ sender: UIButton) {
        self.uncheckStars()
        self.starOne.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starTwo.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
    }
    
    @IBAction func tappedstarThree(_ sender: UIButton) {
        self.uncheckStars()
        self.starOne.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starTwo.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starThree.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
    }
    
    @IBAction func tappedStarFour(_ sender: UIButton) {
        self.uncheckStars()
        self.starOne.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starTwo.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starThree.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starFour.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
    }
    
    
    @IBAction func tappedStarFive(_ sender: UIButton) {
        self.uncheckStars()
        self.starOne.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starTwo.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starThree.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starFour.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starFive.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
    }
    
    @IBAction func tappedSubmitButton(_ sender: UIButton) {
        print(self.placeDetail)
        self.dismiss(animated: true, completion: nil)
    }
}
