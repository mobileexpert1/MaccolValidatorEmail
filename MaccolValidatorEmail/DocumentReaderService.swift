//
//  DocumentReaderService.swift
//  MaccolValidatorEmail
//
//  Created by Mobile on 14/03/24.
//

import DocumentReader


final class DocumentReaderService {
    let kRegulaLicenseFile = "regula.license"
    let kRegulaDatabaseId = "Full"
    
    enum State {
        case downloadingDatabase(progress: Double)
        case initializingAPI
        case completed
        case error(String)
    }

    static let shared = DocumentReaderService()
    func initializeDatabaseAndAPI(progress: @escaping (State) -> Void) {
        guard let licensePath = Bundle.main.path(forResource: "regula.license", ofType: nil) else {
            progress(.error("Missing License File in Framework Bundle"))
            return
        }
        guard let licenseData = try? Data(contentsOf: URL(fileURLWithPath: licensePath)) else {
            progress(.error("Unable to read License File"))
            return
        }

        DispatchQueue.global().async {
            // Mockup function
            self.prepareDatabase(databaseID: self.kRegulaDatabaseId, progressHandler: { (inprogress) in
                progress(.downloadingDatabase(progress: inprogress.fractionCompleted))
            }) { (success, error) in
                if let error = error, !success {
                    progress(.error("Database error: \(error.localizedDescription)"))
                    return
                }
                let config = DocReader.Config(license: licenseData) // Assuming you have a class named `DocReader` with a `Config` struct or class that accepts license data
                // Mockup function
                self.initializeReader(config: config, completion: { (success, error) in
                    DispatchQueue.main.async {
                        progress(.initializingAPI)
                        if success {
                            progress(.completed)
                        } else {
                            progress(.error("Initialization error: \(error?.localizedDescription ?? "nil")"))
                        }
                    }
                })
            }
        }
    }

    // Mockup function, replace with actual implementation
    func prepareDatabase(databaseID: String, progressHandler: @escaping (Progress) -> Void, completion: @escaping (Bool, Error?) -> Void) {
        // Your implementation here
    }

    // Mockup function, replace with actual implementation
    func initializeReader(config: DocReader.Config, completion: @escaping (Bool, Error?) -> Void) {
        // Your implementation here
    }

}

// Mockup struct, replace with actual implementation
struct DocReader {
    struct Config {
        let license: Data
    }
}
