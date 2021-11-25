//
//  ReviewViewController.swift
//  Explore-BR
//
//  Created by Ederson on 02/10/21.
//

import UIKit

class ReviewViewController: UIViewController {
    
    private var controller: ReviewController = ReviewController()
    var alert: Alert?

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
    var countStars:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTextField()
        self.alert = Alert(viewController: self)
        self.controller.delegate(delegate: self)
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
    
    @IBAction func tappedStarOne(_ sender: UIButton) {
        self.uncheckStars()
        self.starOne.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.countStars = 1
    }
    
    @IBAction func tappedStarTow(_ sender: UIButton) {
        self.uncheckStars()
        self.starOne.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starTwo.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.countStars = 2
    }
    
    @IBAction func tappedstarThree(_ sender: UIButton) {
        self.uncheckStars()
        self.starOne.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starTwo.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starThree.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.countStars = 3
    }
    
    @IBAction func tappedStarFour(_ sender: UIButton) {
        self.uncheckStars()
        self.starOne.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starTwo.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starThree.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starFour.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.countStars = 4
    }
    
    @IBAction func tappedStarFive(_ sender: UIButton) {
        self.uncheckStars()
        self.starOne.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starTwo.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starThree.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starFour.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.starFive.setBackgroundImage(UIImage(named: "starImage"), for: .normal)
        self.countStars = 5
    }
    
    @IBAction func tappedSubmitButton(_ sender: UIButton) {
        
        self.controller.saveReview(title: self.titleReviewTextField.text ?? "", review: self.reviewTextView.text ?? "", stars: self.countStars ?? 0)
        /*
         if let message: String = self.validateFields() {
            let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        } else {
            self.titleReviewTextField.text = ""
            self.reviewTextView.text = ""
            self.dismiss(animated: true, completion: nil)
        }
         */
    }
}


extension ReviewViewController: ReviewControllerDelegate{
    func startLoading() {
        //self.showSpinner()
    }
    
    func stopLoading() {
        //self.removeSpinner()
    }
    
    func failureValidateFields(error:ReviewErrorValidate?) {
        
        var msgError: String = ""
        switch error {
            case .invalidTitle:
                msgError = "Título é obrigatório."
        case .invalidReview:
            msgError = "Avaliação é obrigatório."
        case .none:
            msgError = "Erro inesperado."
        }
        
        self.alert?.showAlert(title: "Erro", message: msgError, completion: nil)
    }
    
    func failureRequest(error:ReviewErrorRequest?){
    }
    
    func sucessReview(){
        print("passou no sucess também")
        //self.titleReviewTextField.text = ""
        //self.reviewTextView.text = ""
        self.dismiss(animated: true, completion: nil)
    }
}

