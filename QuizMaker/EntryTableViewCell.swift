//
//  EntryTableViewCell.swift
//  QuizMaker
//
//  Created by Nene Yamasaki on 19/01/2019.
//  Copyright © 2019 Nene Yamasaki. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var questionField: UITextField!
    @IBOutlet weak var questionNumber: UITextView!
    
    var delegate:EntryTableViewCellDelegate?
    var qNumber: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(for entry: QuizEntry, at row: Int){
        self.questionField.text = entry.question
        self.answerField.text = entry.answer
        answerField.delegate = self
        questionField.delegate = self
        questionField.setBottomBoarder()
        answerField.setBottomBoarder()
        self.questionNumber.text = "\(row)" + "."
    }
}

extension EntryTableViewCell : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.delegate!.didEndEditing(cell: self)
        self.delegate!.updateQuestion(for: self)
    }
}

protocol EntryTableViewCellDelegate {
    func updateQuestion(for cell: EntryTableViewCell)
    func didEndEditing(cell: EntryTableViewCell)
}

extension UITextField {
    func setBottomBoarder() {
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.groupTableViewBackground.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
