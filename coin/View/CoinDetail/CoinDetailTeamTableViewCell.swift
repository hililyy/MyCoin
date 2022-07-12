//
//  CoinDetailTeamTableViewCell.swift
//  coin
//
//  Created by 강조은 on 2022/07/12.
//

import UIKit

class CoinDetailTeamTableViewCell: UITableViewCell {
    @IBOutlet weak var teamId: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamPositiom: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
