//
//  ProfileViewController.swift
//  Lesson11HW
//

//

import UIKit

class ProfileViewController: BaseViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var firstNameCountLabel: UILabel!
    
    @IBOutlet weak var lastNameCountLabel: UILabel!
    
    private var editMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
}

// MARK: - Private
private extension ProfileViewController {
    
    func setupActions() {
        updateRigthtBarButton()
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        
        updateUIForEditMode()
        updateCharacterCountLabels()
    }
    
    func updateRigthtBarButton() {
        
        let title = editMode ? "Done" : "Edit"

        let barButton = UIBarButtonItem(
            title: title,
            style: .plain,
            target: self,
            action: #selector(changeModeButtonDidTap)
        )
        
        navigationItem.rightBarButtonItem = barButton
    }
    
    private func updateUIForEditMode() {
        firstNameTextField.isUserInteractionEnabled = editMode
        lastNameTextField.isUserInteractionEnabled = editMode
        firstNameCountLabel.isHidden = !editMode
        lastNameCountLabel.isHidden = !editMode
        
        if editMode {
            firstNameTextField.becomeFirstResponder()
        }
    }
    
    private func updateCharacterCountLabels() {
        let maxCount = 30
        let firstNameCount = firstNameTextField.text?.count ?? 0
        let lastNameCount = lastNameTextField.text?.count ?? 0
        
        firstNameCountLabel.text = "\(maxCount - firstNameCount)"
        lastNameCountLabel.text = "\(maxCount - lastNameCount)"
        
        firstNameCountLabel.textColor = firstNameCount == maxCount ? .red : .green
        lastNameCountLabel.textColor = lastNameCount == maxCount ? .red : .green
    }
    
    @objc func changeModeButtonDidTap() {
        debugPrint("ProfileViewController -> changeModeButtonDidTap")
        
        editMode = !editMode
        updateRigthtBarButton()
        updateUIForEditMode()
    }
}

// MARK: - UITextFieldDelegate
extension ProfileViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text, let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        if updatedText.count <= 30 {
            return true
        } else {
            return false
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        updateCharacterCountLabels()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
