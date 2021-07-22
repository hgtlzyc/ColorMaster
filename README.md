# ColorMaster
 
![](https://github.com/hgtlzyc/ColorMaster/blob/ad6c900f7d95c53ab39b07c909f9aa9d4dd37352/ScreenCapture.gif)

Code snippet:
```swift
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
    //in the collectionVC
    func generateNewColorCards(){
        colorCards = [[]]
        let newTargetColor = ColorController.generateTargetColor()
        targetColor = newTargetColor
        let wrongColors = ColorController.generateWrongColors(within: levelNumber, of: newTargetColor, total: totalWrongOnes)
        let options = wrongColors + [newTargetColor]
            
        colorCards.append([(newTargetColor,"Target")])
        colorCards.append(options.shuffled().map{ ($0, "?") })
        collectionView.reloadData()
    }
    
    let isCorrect = colorCards[indexPath.section][indexPath.row].0 == targetColor


```
