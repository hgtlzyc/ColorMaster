//
//  ColorController.swift
//  ColorMaster
//
//  Created by lijia xu on 7/22/21.
//

import UIKit

enum ColorMatchResult {
    case match
    case off(Int)
}

struct ColorController {

    static func generateTargetColor() -> Color {
        var num: CGFloat { CGFloat( Int.random(in: (60...200)) ) }
        return Color(red: num, green: num, blue: num)
    }
    
    static func generateWrongColors(within int: Int, of target: Color, total: Int) -> [Color] {
        return (1...total).map { _ -> Color in
            var off: CGFloat { CGFloat( Int.random(in: (-int ... int)) ) }
            return Color(red: target.red + off, green: target.green + off, blue: target.blue + off)
        }
    }
    
}
