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
        self.configTextField()
    }
    
    func configTextField(){
        self.titleReviewTextField.layer.borderWidth = 1
        self.titleReviewTextField.layer.borderColor = UIColor.systemGray.cgColor
        
        self.reviewTextView.layer.borderWidth = 1
        self.reviewTextView.layer.borderColor = UIColor.systemGray.cgColor
    }
    
    func uncheckStars(){
        self.starOne.setBackgroundImage(UIImage(named: "StarImageCinza"), for: .normal)
        self.starTwo.setBackgroundImage(UIImage(named: "StarImageCinza"), for: .normal)
        self.starThree.setBackgroundImage(UIImage(named: "StarImageCinza"), for: .normal)
        self.starFour.setBackgroundImage(UIImage(named: "StarImageCinza"), for: .normal)
        self.starFive.setBackgroundImage(UIImage(named: "StarImageCinza"), for: .normal)
    }
    
    private func validateFields() -> String? {
        if self.titleReviewTextField.text == "" {
            return "O Título da Avaliação é obrigatório."
        } else if self.reviewTextView.text == "" {
            return "O campo Avaliação é obrigatório."
        }
        return nil
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
        
        if let message: String = self.validateFields() {
            let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        } else {
            self.titleReviewTextField.text = ""
            self.reviewTextView.text = ""
            self.dismiss(animated: true, completion: nil)
        }
    }
}
