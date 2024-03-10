//
//  MaccolValidatorEmail.swift
//  MaccolValidatorEmail
//
//  Created by Vishal on 10/03/24.
//

import Foundation
import Foundation

public struct MaccolValidatorEmail {
    public static  func isValidEmail(_ email: String) -> Bool {
       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

       let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
       return emailPred.evaluate(with: email)
   }
    public static func sayhellow() {
        print("hghfghfghfgh")
    }
}

