//
//  SecondTableViewCell.swift
//  VegetableData
//
//  Created by Sakshi Yelmame on 12/04/23.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionInfo: UILabel!
    
  static let identifire = "SecondTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "SecondTableViewCell", bundle: nil)
    }
    func configure(vegDescription:String){
        descriptionInfo.text = "\(vegDescription)"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
