//
//  MainScreenState.swift
//  PokaNetFilms
//
//  Created by Кирилл Давыденков on 19.11.23..
//

import Foundation
import UIKit

protocol MainScreenState: AnyObject {
    func showLoading()
    func showContent()
    func showError()
}
