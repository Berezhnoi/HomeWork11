//
//  ContactUsViewController.swift
//  Lesson11HW
//

//

import UIKit

class ContactUsViewController: BaseViewController {
    
    @IBOutlet weak var inputTextView: PlaceholderTextView!
    
    @IBOutlet weak var charCountLabel: UILabel!
    
    @IBOutlet weak var submitButton: UIButton!
    
    let maxCharLimit = 320
    let minCharCountForSubmit = 15

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

}

// MARK: - Private
private extension ContactUsViewController {
    private func setupUI() {
        inputTextView.delegate = self
        updateSubmitButtonState()
        setupButton()
    }
    
    private func setupButton() {
        // Set button border, width, and background color
        submitButton.layer.borderWidth = 1.0
        submitButton.layer.borderColor = UIColor.darkGray.cgColor
        submitButton.layer.cornerRadius = 8
        submitButton.backgroundColor = UIColor.white
        submitButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }

    private func updateCharCount() {
        let currentCharCount = inputTextView.text.count
        charCountLabel.text = "\(currentCharCount)/\(maxCharLimit)"
    }
    
    private func updateSubmitButtonState() {
        let isTextValid = inputTextView.text.count >= minCharCountForSubmit
        submitButton.isEnabled = isTextValid
        submitButton.alpha = isTextValid ? 1.0 : 0.5
        submitButton.setTitleColor(isTextValid ? .systemBlue : .lightGray, for: .normal)
        submitButton.layer.borderColor = isTextValid ? UIColor.systemBlue.cgColor : UIColor.darkGray.cgColor
    }
}

// MARK: - UITextViewDelegate
extension ContactUsViewController: UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {
        updateCharCount()
        updateSubmitButtonState()
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }

        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
        return updatedText.count <= maxCharLimit
    }
}
