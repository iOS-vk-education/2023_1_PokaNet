//
//  MainUnitModel.swift
//  PokaNetFilms
//
//  Created by Кирилл Давыденков on 19.11.23..
//

import UIKit

struct MainUnitModel {

    let title: String
    let reuseIdentifier: String
    var cellText = "aboba"

    init(title: String, reuseIdentifier: String, cellText: String) {
        self.cellText = cellText
        self.reuseIdentifier = reuseIdentifier
        self.title = title
        
    }
}

