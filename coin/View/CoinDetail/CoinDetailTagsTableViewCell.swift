//
//  CoinDetailTagsTableViewCell.swift
//  coin
//
//  Created by 강조은 on 2022/07/12.
//

import UIKit

class CoinDetailTagsTableViewCell: UITableViewCell {
    @IBOutlet weak var tagsId: UILabel!
    @IBOutlet weak var tagsName: UILabel!
    @IBOutlet weak var tagsCoinCounter: UILabel!
    @IBOutlet weak var tagsIcoCounter: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
