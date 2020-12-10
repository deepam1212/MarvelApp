//
//  MarvelCharactorTVC.swift
//  SysmindProject
//
//  Created by Mohd Maruf on 10/12/20.
//  Copyright © 2020 Deepam. All rights reserved.
//
/*Note: - This TVC is used to show the detail of the Marvel Charactor on the Table View on Marvel Theme*/
import UIKit

class MarvelCharactorTVC: UITableViewCell {

    // MARK: - Outlets
    
    // UIImageView to show the marvel charactor Image
    @IBOutlet weak var imageViewMarvelCharactor: UIImageView! {
        didSet {
            imageViewMarvelCharactor.layer.cornerRadius = imageViewMarvelCharactor.frame.height / 2
            imageViewMarvelCharactor.layer.masksToBounds = true
        }
    }
    // UILabel to show the charactor name
    @IBOutlet weak var labelName: UILabel!
    // UILabel to show the charactor description
    @IBOutlet weak var labelDescription: UILabel!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
