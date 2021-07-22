//
//  ColorCollectionViewController.swift
//  ColorMaster
//
//  Created by lijia xu on 7/22/21.
//

import UIKit


class ColorCollectionViewController: UICollectionViewController {

    private var colorCards = [ [(Color,String)] ]()
    private var targetColor: Color?
    var levelNumber: Int = 22
    var totalWrongOnes: Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateNewColorCards()
    }

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
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return colorCards.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return colorCards[section].count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorCell", for: indexPath) as? ColorCollectionViewCell else { return UICollectionViewCell() }
        
        let cellTuple = colorCards[indexPath.section][indexPath.row]
        
        let colorTuple = cellTuple.0.normalizedColor
        let cellUIColor = UIColor(red: colorTuple.r, green: colorTuple.g, blue: colorTuple.b, alpha: 1.0)
        
        cell.updateViews(color: cellUIColor, label: cellTuple.1)
        
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.section != 1, let targetColor = targetColor else { return }
        
        let isCorrect = colorCards[indexPath.section][indexPath.row].0 == targetColor
        presentResultAlert(isCorrect)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSettingVC" {
            guard let targetVC = segue.destination as? SettingsViewController else { return }
            targetVC.variantNumber = levelNumber
            targetVC.optionsNumber = totalWrongOnes
            targetVC.delegate = self
            
        }
    }
    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }

}//End Of VC

extension ColorCollectionViewController: SettingVCDelegate{
    func updateUserSettings(variant: Int, options: Int) {
        totalWrongOnes = options
        levelNumber = variant
        generateNewColorCards()
    }
}


extension ColorCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 1:
            let width = view.frame.width * 0.5
            return  CGSize(width: width, height: width * (0.8))
        default:
            let width = view.frame.width * 0.3
            return CGSize(width: width, height: width * (4/3))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        switch section {
        case 0:
            let inset = view.frame.width * 0.25
            return UIEdgeInsets(top: 20, left: inset, bottom: 0, right: 0)
        default:
            let inset = 0.1 * view.frame.width / 3
            return UIEdgeInsets(top: inset, left: inset, bottom: 0, right: inset)
        }
       
    }

} //End Of Extension

// MARK: - Alert
extension ColorCollectionViewController {
    func presentResultAlert(_ isCorrect: Bool){

        let title = isCorrect ? "Good Eyes" : "Wrong"
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "Keep Looking", style: .default, handler: nil)
        
        let shuffleAction = UIAlertAction(title: "Play Again", style: .default) { _ in
            self.generateNewColorCards()
        }
        
        if isCorrect {
            alert.addAction(shuffleAction)
        } else {
            alert.addAction(doneAction)
        }
        
        present(alert, animated: true)
        
    }
}
