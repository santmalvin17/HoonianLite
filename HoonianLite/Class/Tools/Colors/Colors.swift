//
//  Colors.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 19/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import Foundation
import UIKit

class Colors {
    var gl:CAGradientLayer!

    init() {
        let colorTop = #colorLiteral(red: 0.5436835885, green: 0.7927338481, blue: 0.7610974908, alpha: 1).cgColor
        let colorBottom = #colorLiteral(red: 0.3232848644, green: 0.3534849286, blue: 0.5449434519, alpha: 1).cgColor

        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}
