//
//  ViewModels.swift
//  ArchTest01
//
//  Created by Richard Adem on 9/28/16.
//  Copyright © 2016 Richard Adem. All rights reserved.
//

import UIKit


struct MinionModeViewModel: SwitchWithTextViewPresentable {
    //    This would usually be instantiated with the model
    //    to be used to derive the information below
    //    but in this case, my app is pretty static
}

// MARK: TextPresentable Conformance
extension MinionModeViewModel {
    var text: String { return "Minion Mode" }
    var textColor: UIColor { return .black }
    var font: UIFont { return .systemFont(ofSize: 17.0) }
}

// MARK: SwitchPresentable Conformance
extension MinionModeViewModel {
    var switchOn: Bool { return false }
    var switchColor: UIColor { return .yellow }
    
    func onSwitchTogleOn(on: Bool) {
        if on {
            print("The Minions are here to stay!")
        } else {
            print("The Minions went out to play!")
        }
    }
}

// MARK: ImagePresentable Conformance
extension MinionModeViewModel {
    var imageName: String { return "Icon" }
}
