//
//  HomeViewController.swift
//  Notiz
//
//  Created by Ramy Sabry on 08/02/2021.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var emptyNotesView: UIView!
    @IBOutlet weak var emptyItemsImage: UIImageView!
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var createNewNoteButton: UIButton!
    
    private lazy var presenter = HomeVCPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        presenter.viewDidLoad()
    }

    fileprivate func configureViews() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.topItem?.title = "Notes"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.white
        createNewNoteButton.setShadow(withCornerRadius: 25)
        createNewNoteButton.setTitleColor(UIColor.gray, for: .highlighted)
        emptyNotesView.backgroundColor = UIColor.clear
        emptyNotesView.isHidden = true
        emptyItemsImage.image = UIImage(named: "emptyListImage3")
        configureListTableView()
    }
    
    // MARK:- IBActions
    @IBAction func createNewNoteButtonAction(_ sender: UIButton) {
        presenter.createNewNoteButtonActionFired()
    }
}

// MARK:- Presenter Delegate
extension HomeViewController: HomeVCView {
    func presentCreateNewNoteScreen() {
        if let createNewNoteViewController = Navigator.navigate(form: self, to: .createNew, with: .present(transitionStyle: .coverVertical), animated: true) as? CreateNoteViewController {
            createNewNoteViewController.delegate = self
        }
    }
    
    func reloadListTableView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.listTableView.reloadData()
        }
    }
    
    func changeEmptyNotesApperance(hidden: Bool) {
        emptyNotesView.isHidden = hidden
    }
}


// MARK:- CreateNewNote Delegate
extension HomeViewController: CreateNoteDelegate {
    func onAddingNewNote(note: NoteModel) {
        presenter.newNoteCreated(note: note)
    }
}


// MARK: - Setup Table View
extension HomeViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
    
    func configureListTableView() {
        listTableView.dataSource = self
        listTableView.delegate = self
        listTableView.register(
            UINib(nibName: NoteCell.reuseIdentifier, bundle: nil),
            forCellReuseIdentifier: NoteCell.reuseIdentifier)
        listTableView.separatorStyle = .none
        listTableView.prefetchDataSource = self
        listTableView.backgroundColor = UIColor(hexString: "#F8F9FC")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNotesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: NoteCell.reuseIdentifier,
            for: indexPath) as! NoteCell
        presenter.cellConfingure(cell, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            presenter.deleteNote(with: indexPath)
        }
    }
}
