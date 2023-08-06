//
//  DropdownViewController.swift
//  Cinemax
//
//  Created by Андрей Василинич on 10.07.2023.
//

import UIKit

protocol DropdownViewControllerDelegate: AnyObject {
    func didSelectOption(option: String)
    
}

class DropdownViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerView: UIPickerView!
    weak var delegate: DropdownViewControllerDelegate?
    var customFilterButton: UIBarButtonItem?
    var viewModel = DropdownModel()
    private var confirmButton: UIButton!
    private var selectedOption: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.086, green: 0.086, blue: 0.129, alpha: 1.0)
        
        selectedOption = viewModel.dropdownOptions.first
        
        confirmButton = UIButton(type: .system)
        confirmButton.frame = CGRect(x: 200, y: 240, width: 120, height: 30)
        confirmButton.backgroundColor = UIColor(red: 0.969, green: 0.263, blue: 0.275, alpha: 1.0)
        confirmButton.layer.cornerRadius = 10
        confirmButton.tintColor = .white
        confirmButton.setTitle("Подтвердить", for: .normal)
        confirmButton.isEnabled = false
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        view.addSubview(confirmButton)
        

        
        pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // Additional setup for the pickerView, such as frame, appearance, etc.
        // For example:
        pickerView.frame = CGRect(x: 0, y: 0, width: 400, height: 240)
        
        view.addSubview(pickerView)
    }
    
    @objc private func confirmButtonTapped() {
        guard let selectedOption = selectedOption
        else {
            return
        }
        
        delegate?.didSelectOption(option: selectedOption)
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // Number of components in the pickerView
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.dropdownOptions.count + 1 // Number of rows in the pickerView
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
           let options = viewModel.dropdownOptions
           
           guard row >= 0 && row < options.count else {
               return nil
           }
           
           let title = options[row]
           let attributes: [NSAttributedString.Key: Any] = [
               .foregroundColor: UIColor.white // Set your desired text color here
           ]
           
           return NSAttributedString(string: title, attributes: attributes)
       }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let options = viewModel.dropdownOptions
        
        if row == 0 {
            return "Выберите фильм" // Return the empty value for the first row
        } else {
            return options[row - 1] // Adjust the row index to account for the empty value
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if row == 0 {
            selectedOption = nil
            confirmButton.isEnabled = false// Set the selected option to nil for the empty value
        } else {
            selectedOption = viewModel.dropdownOptions[row - 1] // Adjust the row index to account for the empty value
            confirmButton.isEnabled = true
        }
    }
    
       
}
