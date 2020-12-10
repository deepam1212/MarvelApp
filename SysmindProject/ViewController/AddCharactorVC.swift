//
//  AddCharactorVC.swift
//  SysmindProject
//
//  Created by Mohd Maruf on 10/12/20.
//  Copyright © 2020 Deepam. All rights reserved.
//
/*Note: - This VC is used to add the Marvel Charactor to the List*/
import UIKit

class AddCharactorVC: UIViewController {

    // MARK: - Outlets
    
    // UIImageView of the Charactor
    @IBOutlet weak var imageViewCharactor: UIImageView! {
        didSet {
            imageViewCharactor.layer.cornerRadius = 100
            imageViewCharactor.layer.masksToBounds = true
        }
    }
    // UITextField to enter the Charactor Name
    @IBOutlet weak var textFieldCharactorName: UITextField! {
        didSet {
            textFieldCharactorName.setLeftPaddingPoints(10)
            textFieldCharactorName.layer.cornerRadius = 10
            textFieldCharactorName.layer.masksToBounds = true
            textFieldCharactorName.layer.borderWidth = 1
            textFieldCharactorName.layer.borderColor = UIColor.red.cgColor
        }
    }
    // UITextField to enter the Charactor Description
    @IBOutlet weak var textFieldCharactorDescription: UITextField! {
        didSet {
            textFieldCharactorDescription.setLeftPaddingPoints(10)
            textFieldCharactorDescription.layer.cornerRadius = 10
            textFieldCharactorDescription.layer.masksToBounds = true
            textFieldCharactorDescription.layer.borderWidth = 1
            textFieldCharactorDescription.layer.borderColor = UIColor.red.cgColor
        }
    }
    // UIButton to Post the Charactor
    @IBOutlet weak var buttonPost: UIButton!
    
    // MARK: - Variable
    
    // To Pick the Imag from the gallery
    var imagePicker = UIImagePickerController()
    //  Modal through which we save the Marvel Charactr Information
    var addCharactorModal = AddCharactorModal()
    // Call Back to update the Modal on to the MarvelThemeVC
    var callBackForModalUpdation:((_ modal: AddCharactorModal)->())?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialUi()
    }
    
    // MARK: - Class Function
    
    // UI which is shown Initially
    func initialUi() {
        buttonPost.layer.cornerRadius = 10
        buttonPost.layer.masksToBounds = true
    }
    
    // MARK: - Action
    
    // Action to Add Images from Camera/ Gallery
    @IBAction func addImagesAction(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    // Action to Post the Charactor
    @IBAction func postAction(_ sender: UIButton) {
        addCharactorModal.charactorImage = imageViewCharactor.image ?? UIImage()
        addCharactorModal.charactorName = textFieldCharactorName.text ?? ""
        addCharactorModal.charactorDescriptoion = textFieldCharactorDescription.text ?? ""
        if let callBackForModalUpdation = self.callBackForModalUpdation {
            callBackForModalUpdation(self.addCharactorModal)
        }
        UIView.animate(withDuration: 0.6,
        animations: {
            self.buttonPost.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        },
        completion: { _ in
            UIView.animate(withDuration: 0.6) {
                self.navigationController?.popViewController(animated: true)
            }
        })
    }
}

// MARK: - UITextFieldDelegate
extension AddCharactorVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldCharactorName {
            textFieldCharactorDescription.becomeFirstResponder()
        } else {
            textFieldCharactorDescription.resignFirstResponder()
        }
        
        return true
    }
}

// MARK: - UINavigationControllerDelegate, UIImagePickerControllerDelegate
extension AddCharactorVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageViewCharactor.image = pickedImage
        }

        imagePicker.dismiss(animated: true, completion: nil)
    }
}
