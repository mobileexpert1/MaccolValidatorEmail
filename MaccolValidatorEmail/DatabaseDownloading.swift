//
//  DatabaseDownloading.swift
//  MaccolValidatorEmail
//
//  Created by Mobile on 14/03/24.
//

import Foundation
import DocumentReader

public class DataBaseDownloanding {
    
    public func Startdownloding() -> (progressValue: String, status: String) {
        var progressValue = ""
        var status = ""
        
        DocumentReaderService.shared.initializeDatabaseAndAPI(progress: { [weak self] state in
            guard let self = self else { return }
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
        })
        
        return (progressValue, status)
    }
}
