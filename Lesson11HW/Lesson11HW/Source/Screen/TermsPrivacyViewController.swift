//
//  TermsPrivacyViewController.swift
//  Lesson11HW
//

//

import UIKit

class TermsPrivacyViewController: BaseViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var agreeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        agreeButton.isEnabled = false
        
        configureTextView()
    }
}

// MARK: - Private
private extension TermsPrivacyViewController {
    private func setButtonEnabledStyle() {
        agreeButton.isEnabled = true
        agreeButton.tintColor = UIColor.systemBlue
        agreeButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    private func configureTextView() {
        textView.isEditable = false
        textView.isSelectable = true
        textView.textContainerInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        textView.delegate = self
    }
}

// MARK: - UITextViewDelegate
extension TermsPrivacyViewController: UITextViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let frameHeight = scrollView.frame.size.height
        
        // Check if the user has scrolled to the bottom
        if !agreeButton.isEnabled && offsetY >= contentHeight - frameHeight {
            setButtonEnabledStyle()
        }
    }
}
