//
//  ListTableViewCell.swift
//  Pokeman-demo
//
//  Created by Apple on 03/06/2022.
//

import UIKit
protocol TableViewCellDelegate{
    func statusChanged(_ index: Int, isSelected: Bool)
}
class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var selectedButton: UIButton!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    var delegate : TableViewCellDelegate?
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectedButton.addTarget(self, action: #selector(selectedButtonTapped(_:)), for: .touchUpInside)
    }
    public func configure(info: OptionVM) {
        titleLabel.text = info.userName
        subLabel.text = info.password
    }
    @objc func selectedButtonTapped(_ sender : UIButton){
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            self.statusImageView.image = UIImage(named: "icon_selected")
        }else{
            self.statusImageView.image = UIImage(named: "icon_unselected")

        }
        delegate?.statusChanged(sender.tag, isSelected: sender.isSelected)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
