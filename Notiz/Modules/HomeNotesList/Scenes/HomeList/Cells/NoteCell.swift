//
//  NoteCell.swift
//  Notiz
//
//  Created by Ramy Sabry on 08/02/2021.
//

import UIKit

class NoteCell: UITableViewCell {

    @IBOutlet weak var noteTextLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        selectionStyle = UITableViewCell.SelectionStyle.none
        backgroundColor = UIColor.clear
        containerView.backgroundColor = UIColor.white
        containerView.layer.cornerRadius = 2.5
        containerView.layer.masksToBounds = true
    }

}


extension NoteCell: NoteCellViewProtocol {
    func displayData(note: String) {
        noteTextLabel.text = note
    }
}
