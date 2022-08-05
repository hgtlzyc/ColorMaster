//
//  Color.swift
//  ColorMaster
//
//  Created by lijia xu on 7/22/21.
//

import UIKit


struct Color: Equatable {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    
    var normalizedColor: (r: CGFloat, g: CGFloat, b: CGFloat) {
        return (r: red/255.0, g: green/255.0, b: blue/255.0)
    }
}

