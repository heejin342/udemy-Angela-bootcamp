//
//  MesseingCell.swift
//  Flash Chat iOS13
//
//  Created by 김희진 on 2022/05/18.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class MesseingCell: UITableViewCell {

    @IBOutlet var mesageBubble: UIView!
    @IBOutlet var label: UILabel!
    @IBOutlet var rightImageView: UIImageView!
    @IBOutlet var leftImageVIew: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        mesageBubble.layer.cornerRadius = mesageBubble.frame.size.height / 4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
