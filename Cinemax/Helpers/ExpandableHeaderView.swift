//
//  ExpandableHeaderView.swift
//  Cinemax
//
//  Created by Андрей Василинич on 04.07.2023.
//

import UIKit

class DropdownViewModel {
    private let model = DropdownModel()
    var isDropdownVisible = false

    var dropdownOptions: [String] {
        return model.dropdownOptions
    }

    func toggleDropdown() {
        isDropdownVisible.toggle()
    }

    func didSelectOption(at index: Int) {
        let selectedOption = dropdownOptions[index]
        // Обработка выбора элемента из выпадающего списка
        print("Selected option: \(selectedOption)")
        toggleDropdown()
    }
}


