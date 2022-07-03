//
//  CoinListTableViewCell.swift
//  MyCoin
//
//  Created by 강조은 on 2022/06/28.
//

import UIKit

class CoinListTableViewCell: UITableViewCell {
    @IBOutlet weak var coinRank: UILabel!
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var coinSymbol: UILabel!
    @IBOutlet weak var newIcon: UIImageView!
    @IBOutlet weak var activeIcon: UIImageView!
    @IBOutlet weak var heartBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        newIcon.isHidden = true
        activeIcon.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
