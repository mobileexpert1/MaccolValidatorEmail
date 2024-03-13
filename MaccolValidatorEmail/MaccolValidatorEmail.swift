//
//  MaccolValidatorEmail.swift
//  MaccolValidatorEmail
//
//  Created by Vishal on 10/03/24.
//

import Foundation
import Foundation


public class MaccolValidatorEmail {
    public static  func isValidEmail(_ email: String) -> Bool {
       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

       let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
       return emailPred.evaluate(with: email)
   }
    public static func sayhellow() {
        print("hghfghfghfgh")
    }
    
    public static func faceLivenessApi(completion: @escaping ([String: Any]?) -> Void) {
        guard let apiURL = URL(string: "https://ipassplus.csdevhub.com/api/v1/aws/create/session") else { return }

        var request = URLRequest(url: apiURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = [
            "accessKeyId": "YOUR_ACCESS_KEY_ID",
            "secretAccessKey": "YOUR_SECRET_ACCESS_KEY"
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch {
            print("Error encoding parameters: \(error)")
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error making API request: \(error)")
                completion(nil)
                return
            }

            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        completion(json)
                    } else {
                        print("Invalid JSON response")
                        completion(nil)
                    }
                } catch {
                    print("Error decoding JSON response: \(error)")
                    completion(nil)
                }
            } else {
                print("No data received from the API")
                completion(nil)
            }
        }

        task.resume()
    }
    
 
//  public static func faceLivenessApi(completion: @escaping ([String: Any]?) -> Void) {
//        guard let apiURL = URL(string: "https://ipassplus.csdevhub.com/api/v1/aws/create/session") else { return }
//
//        var parameters: [String: Any] = [:]
//        parameters["accessKeyId"] = "AKIATYNYEEOCH5HZ5X2E"
//        parameters["secretAccessKey"] = "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"
//
//        AF.request(apiURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: HTTPHeaders(["Content-Type": "application/json"]))
//            .responseJSON { response in
//                let status = response.response?.statusCode
//
//                if status == 201 {
//                    if let value = response.value as? [String: Any] {
//                        completion(value)
//                    } else {
//                        completion(nil)
//                    }
//                } else {
//                    // Show Alert error
//                    completion(nil)
//                }
//            }
//    }
    
    
}

