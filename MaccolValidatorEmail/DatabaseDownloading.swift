//
//  DatabaseDownloading.swift
//  MaccolValidatorEmail
//
//  Created by Mobile on 14/03/24.
//

import Foundation
import DocumentReader

public class DataBaseDownloanding {
    
    public static func Startdownloding(completion: @escaping (String, String) -> Void) {
        DocumentReaderService.shared.initializeDatabaseAndAPI(progress: { state in
            var progressValue = ""
            var status = ""
            
            switch state {
            case .downloadingDatabase(progress: let progress):
                let progressString = String(format: "%.1f", progress * 3)
                progressValue = "Downloading database: \(progressString)%"
            case .initializingAPI:
                status = "Initializing..."
            case .completed:
                // Handle completion if needed
                break
            case .error(let text):
                status = text
                print(text)
            }
            
            completion(progressValue, status)
        })
    }
}
