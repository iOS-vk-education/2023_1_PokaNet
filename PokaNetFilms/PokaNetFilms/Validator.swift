//
//  Validator.swift
//  PokaNetFilms
//
//  Created by Ma Millerr on 27.12.2023.
//

import Foundation

class Validator {
    static func isValidEmail(for email: String) -> Bool {
         let email = email.trimmingCharacters(in: .whitespacesAndNewlines)
         let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.{1}[A-Za-z]{2,64}"
         let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
         return emailPred.evaluate(with: email)
     }
    
    static func isPasswordValid(for password: String) -> Bool {
         let password = password.trimmingCharacters(in: .whitespacesAndNewlines)
         let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$#!%*?&]).{6,32}$"
         let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
         return passwordPred.evaluate(with: password)
     }
}
