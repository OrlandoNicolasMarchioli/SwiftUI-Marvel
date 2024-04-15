//
//  SideBarOption.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 15/04/2024.
//

import Foundation

enum MenuOption: String, Identifiable, CaseIterable {
    case comics = "Comics"
    case characters = "Characters"
    
    var id: String { self.rawValue }
}
