//
//  ProfileViewController.swift
//  Lesson11HW
//

//

import UIKit

class ProfileViewController: BaseViewController {
    
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
    
    @objc func changeModeButtonDidTap() {
        debugPrint("ProfileViewController -> changeModeButtonDidTap")
        
        editMode = !editMode
        updateRigthtBarButton()
    }
}
