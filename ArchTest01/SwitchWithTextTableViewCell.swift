//
//  SwitchWithTextTableViewCell.swift
//  ArchTest01
//
//  Created by Richard Adem on 9/28/16.
//  Copyright © 2016 Richard Adem. All rights reserved.
//

import UIKit

// protocol composition - based on the UI components in the cell
typealias SwitchWithTextViewPresentable = TextPresentable & SwitchPresentable & ImagePresentable

class SwitchWithTextTableViewCell: UITableViewCell, ConfigurableTableViewCell {
    

    
    // MARK: Views
    
    lazy var label: UILabel = {
        let label = UILabel(frame: self.bounds.divided(atDistance: 50, from: .maxXEdge).remainder)
        self.addSubview(label)
        return label
    }()
    
    lazy var switchToggle:UISwitch = {
        let switchToggle:UISwitch = UISwitch(frame: self.bounds.divided(atDistance: 50, from: .maxXEdge).slice)
        switchToggle.addTarget(self, action: #selector(onSwitchToggle), for: .valueChanged)
        self.addSubview(switchToggle)
        return switchToggle
    }()
    
    lazy var iconImageView:UIImageView = {
        let imageView:UIImageView = UIImageView(frame: self.bounds.divided(atDistance: 50, from: .maxXEdge).slice.offsetBy(dx: -60, dy: 0))
        
        self.addSubview(imageView)
        return imageView
    }()
    
    private var delegate: SwitchWithTextViewPresentable?
    
    
    // configure with something that conforms to the composed protocol
    func configure(withPresenter presenter: SwitchWithTextViewPresentable) {
        delegate = presenter
        
        // configure the UI components
        label.text = presenter.text
        
        switchToggle.isOn = presenter.switchOn
        switchToggle.onTintColor = presenter.switchColor
        
        iconImageView.image = UIImage(named: presenter.imageName)
        
        backgroundColor = UIColor.orange
    }
    static var cellIdentifier: String = "SwitchTableViewCellIdentifier"
    
    func onSwitchToggle(sender: UISwitch) {
        delegate?.onSwitchTogleOn(on: sender.isOn)
    }
    
    // MARK: - View lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
