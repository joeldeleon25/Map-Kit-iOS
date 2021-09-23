//
//  ItemListTableViewCell.swift
//  GuiaMap
//
//  Created by Roberto Martinez on 21/9/21.
//

import UIKit

class ItemListTableViewCell: UITableViewCell {
	
	@IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
}
