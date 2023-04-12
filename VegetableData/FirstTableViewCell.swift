//
//  FirstTableViewCell.swift
//  VegetableData
//
//  Created by Sakshi Yelmame on 12/04/23.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    static let identifier = "FirstTableViewCell"
    
    @IBOutlet weak var vegImage: UIImageView!
    @IBOutlet weak var vegName: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "FirstTableViewCell", bundle: nil)
    }
    public func configure(vegName : String, vegImageName : String){
        self.vegName.text = vegName
        self.vegImage.image = UIImage(named: vegImageName)
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
