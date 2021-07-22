//
//  SettingsViewController.swift
//  ColorMaster
//
//  Created by lijia xu on 7/22/21.
//

import UIKit

protocol SettingVCDelegate: AnyObject {
    func updateUserSettings(variant: Int, options: Int)
}


class SettingsViewController: UIViewController {
    
    @IBOutlet weak var variantLabel: UILabel!
    @IBOutlet weak var variantSlider: UISlider!
    @IBOutlet weak var optionsLabel: UILabel!
    @IBOutlet weak var optionsSliderOutlet: UISlider!
    
    var variantNumber: Int!
    var optionsNumber: Int!
    
    weak var delegate: SettingVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        variantSlider.minimumValue = 5
        variantSlider.maximumValue = 50
        variantSlider.value = Float(variantNumber)
        
        optionsSliderOutlet.minimumValue = 2
        optionsSliderOutlet.maximumValue = 15
        optionsSliderOutlet.value = Float(optionsNumber)
        
        updateTextLabels()
        
    }

    
    @IBAction func variantSliderChanged(_ sender: UISlider) {
        variantNumber = Int(sender.value)
        updateTextLabels()
    }
    
    
    @IBAction func optionsValueChanged(_ sender: UISlider) {
        optionsNumber = Int(sender.value)
        updateTextLabels()
    }
    
    @IBAction func updateButtonPressed(_ sender: Any) {
        delegate?.updateUserSettings(variant: variantNumber, options: optionsNumber)
        self.dismiss(animated: true)
    }
    
    // MARK: - Helper
    func updateTextLabels(){
        variantLabel.text = "variant within \(variantNumber!) of RGB"
        optionsLabel.text = "showing \(optionsNumber!) wrong options"
    }
    
}//End Of VC
