//
//  ProfileScreenState.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 17.11.2023.
//

import Foundation
import UIKit

protocol ProfileScreenState: AnyObject {
    func showLoading()
    func showContent()
    func showError()
}
