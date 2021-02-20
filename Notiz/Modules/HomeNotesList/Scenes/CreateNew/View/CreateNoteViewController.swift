//
//  CreateNoteViewController.swift
//  Notiz
//
//  Created by Ramy Sabry on 08/02/2021.
//

import UIKit

protocol CreateNoteDelegate: class {
    func onAddingNewNote(note: NoteModel)
}

class CreateNoteViewController: BaseViewController {
    
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    private lazy var presenter = CreateNoteVCPresenter(view: self)
    var delegate: CreateNoteDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        presenter.viewDidLoad()
    }

    fileprivate func configureViews() {
        saveButton.isEnabled = false
        configureTextView()
    }
    
    private func configureTextView() {
        textView.text = nil
        textView.delegate = self
        textView.layer.cornerRadius = 5
    }

    // MARK:- IBActions
    @IBAction func backButtonAction(_ sender: UIButton) {
        presenter.backButtonActionFired()
    }
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        guard let noteText: String = textView.text else { return }
        presenter.saveNoteActionFied(note: noteText)
    }
}

// MARK:- Presenter Delegate
extension CreateNoteViewController: CreateNoteVCView {
    func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    func setDateLabel(to text: String) {
        subTitleLabel.text = text
    }
}

// MARK:- NoteTextView Delegate
extension CreateNoteViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView == textView {
            saveButton.isEnabled = (textView.text.count > 0)
        }
    }
}
