//
//  BaseViewController.swift
//  Lesson11HW
//

//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
}

// MARK: - Private
private extension BaseViewController {
    
    func setupAppearance() {
        view.backgroundColor = .systemGroupedBackground
    }
}
