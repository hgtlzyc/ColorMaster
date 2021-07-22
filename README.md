# ColorMaster
 
![](https://github.com/hgtlzyc/ColorMaster/blob/a605faad31804997836c9c9d270110652b314dae/ScreenCapture.gif)

Code snippet:
```swift
struct ColorController {

    static func generateTargetColor() -> Color {
        var num: CGFloat { CGFloat( Int.random(in: (100...150)) ) }
        return Color(red: num, green: num, blue: num)
    }
    
    static func generateWrongColors(within int: Int, of target: Color, total: Int) -> [Color] {
        return (1...total).map { _ -> Color in
            var off: CGFloat { CGFloat( Int.random(in: (-int ... int)) ) }
            return Color(red: target.red + off, green: target.green + off, blue: target.blue + off)
        }
    }
    
}
    //in the collectionVC
    func generateNewColorCards(){
        colorCards = [[]]
        let newTargetColor = ColorController.generateTargetColor()
        targetColor = newTargetColor
        let wrongColors = ColorController.generateWrongColors(within: levelNumber, of: newTargetColor, total: totalWrongOnes)
        let options = wrongColors + [newTargetColor]
            
        colorCards.append([(newTargetColor,"Target")])
        colorCards.append(options.map{ ($0, "?") })
        collectionView.reloadData()
    }
    
    let isCorrect = colorCards[indexPath.section][indexPath.row].0 == targetColor


```
