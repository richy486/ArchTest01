//
//  Presentables.swift
//  ArchTest01
//
//  Created by Richard Adem on 9/28/16.
//  Copyright © 2016 Richard Adem. All rights reserved.
//

import UIKit

// MARK: Configurable

protocol ConfigurableTableViewCell {
    func configure(withPresenter presenter: SwitchWithTextViewPresentable)
    static var cellIdentifier: String { get }
}

// MARK: Text
protocol TextPresentable {
    var text: String { get }
    var textColor: UIColor { get }
    var font: UIFont { get }
}

// MARK: Text field
protocol TextFieldPresentable {
    var placeholder: String { get }
    var text: String { get }
    
    func onTextFieldDidEndEditing(textField: UITextField)
}

// MARK: Switch
protocol SwitchPresentable {
    var switchOn: Bool { get }
    var switchColor: UIColor { get }
    func onSwitchTogleOn(on: Bool)
}

extension SwitchPresentable {
    var switchColor: UIColor { return .yellow }
}

// MARK: Image
protocol ImagePresentable {
    var imageName: String { get }
}

