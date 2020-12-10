//
//  ViewController.swift
//  SysmindProject
//
//  Created by Mohd Maruf on 10/12/20.
//  Copyright © 2020 Deepam. All rights reserved.
//
/*Note: - This Class is used to show the list of marvel characters*/
import UIKit

class MarvelThemeVC: UIViewController {
    
    // MARK: - Outlets
    
    // UIButton to show the button to add Charactor
    @IBOutlet weak var buttonAddCharactor: UIButton!
    // UITableView to show the Marvel Charactor
    @IBOutlet weak var tableViewCharactor: UITableView! {
        didSet {
            tableViewCharactor.register(UINib(nibName: "MarvelCharactorTVC", bundle: nil), forCellReuseIdentifier: "MarvelCharactorTVC")
        }
    }
    
    // MARK: - variable
    
    //  Modal through which we save the Marvel Charactr Information
    var marvelCharactorModal = [AddCharactorModal]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialUi()
    }
    
    // MARK: - Class Function
    
    // UI which is shwon Initially
    func initialUi() {
        if #available(iOS 13.0, *) {
            buttonAddCharactor.setImage(#imageLiteral(resourceName: "add").withTintColor(.white), for: .normal)
        } else {
            buttonAddCharactor.setImage(#imageLiteral(resourceName: "add"), for: .normal)
        }
    }
    
    // MARK: - Action
    
    // Action to Move to the Marvel Charactor VC
    @IBAction func addCharactorAction(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: Storyboard.Main.rawValue, bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "AddCharactorVC") as! AddCharactorVC
        vc.callBackForModalUpdation = {[unowned self] modal in
            self.marvelCharactorModal.append(modal)
            self.tableViewCharactor.reloadData()
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UITableViewDelegate
extension MarvelThemeVC: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension MarvelThemeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = marvelCharactorModal.count
        data == 0 ? tableView.setEmptyMessageInBold(Constants.kNoMarvelCharactor) : tableView.restore()
        return data
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MarvelCharactorTVC") as? MarvelCharactorTVC else {
            return MarvelCharactorTVC()
        }
        
        if indexPath.row < self.marvelCharactorModal.count {
            let modal = self.marvelCharactorModal[indexPath.row]
            cell.imageViewMarvelCharactor.image = modal.charactorImage
            cell.labelName.text = modal.charactorName
            cell.labelDescription.text = modal.charactorDescriptoion
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.tableViewCharactor.beginUpdates()
            if indexPath.row < self.marvelCharactorModal.count {
                self.marvelCharactorModal.remove(at: indexPath.row)
                self.tableViewCharactor.deleteRows(at: [indexPath], with: .none)
            }
            self.tableViewCharactor.endUpdates()
        }
    }
}

