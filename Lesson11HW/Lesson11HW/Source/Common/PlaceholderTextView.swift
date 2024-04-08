//
//  PlaceholderTextView.swift
//  Lesson11HW
//
//  Created by rendi on 27.03.2024.
//

import UIKit

class PlaceholderTextView: UITextView {

    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override var text: String! {
        didSet {
            placeholderLabel.isHidden = !self.text.isEmpty
        }
    }
    
    var placeholder: String = "Type Here" {
        didSet {
            placeholderLabel.text = placeholder
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUITextView()
        setupPlaceholder()
    }
    
    private func setupUITextView() {
        textContainerInset = UIEdgeInsets(top: 12, left: 5, bottom: 10, right: 10)
        // Adding border
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 5.0
    }

    private func setupPlaceholder() {
        addSubview(placeholderLabel)

        // Constraints
        NSLayoutConstraint.activate([
            placeholderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10), // Adjust the constant values as needed
            placeholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            placeholderLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])

        // Initial setup
        placeholderLabel.text =  placeholder;
        placeholderLabel.isHidden = !self.text.isEmpty
    }

    @objc private func textChanged(notification: Notification) {
        placeholderLabel.isHidden = !self.text.isEmpty
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        NotificationCenter.default.addObserver(self, selector: #selector(textChanged), name: UITextView.textDidChangeNotification, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

