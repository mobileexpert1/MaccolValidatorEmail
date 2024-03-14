//
//  MaccolValidatorEmail.swift
//  MaccolValidatorEmail
//
//  Created by Vishal on 10/03/24.
//

import Foundation
import DocumentReader


public class CeateessionApi {
    
    public static func faceLivenessApi(completion: @escaping ([String: Any]?) -> Void) {
        guard let apiURL = URL(string: "https://ipassplus.csdevhub.com/api/v1/aws/create/session") else { return }

        var request = URLRequest(url: apiURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = [
            "accessKeyId": "AKIATYNYEEOCH5HZ5X2E",
            "secretAccessKey": "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"
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
    

    
}

