//
//  TextTableViewCell.swift
//  ArchTest01
//
//  Created by Richard Adem on 9/29/16.
//  Copyright © 2016 Richard Adem. All rights reserved.
//

import UIKit

// protocol composition - based on the UI components in the cell
typealias TextViewPresentable = TextPresentable

class TextTableViewCell: UITableViewCell, ConfigurableTableViewCell {
    
    lazy var label: UILabel = {
        let label = UILabel(frame: self.bounds.divided(atDistance: 50, from: .maxXEdge).remainder)
        self.addSubview(label)
        return label
    }()
    
    private var delegate: TextViewPresentable?
    
    
    // configure with something that conforms to the composed protocol
    internal func configure(withPresenter presenter: SwitchWithTextViewPresentable) {
        delegate = presenter
        
        // configure the UI components
        label.text = presenter.text
        
        backgroundColor = UIColor.green
    }
    static var cellIdentifier: String = "TextTableViewCellIdentifier"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
