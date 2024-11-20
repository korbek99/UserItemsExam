//
//  UserTableViewCell.swift
//  UserItemsExam
//
//  Created by Jose Preatorian on 19-11-24.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    lazy var labelName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textAlignment = .center
        label.frame = contentView.bounds
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUX()
    }
    
    
    func setupUX() {
        contentView.backgroundColor = .white
        contentView.addSubview(labelName)
        labelName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        labelName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        labelName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
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
