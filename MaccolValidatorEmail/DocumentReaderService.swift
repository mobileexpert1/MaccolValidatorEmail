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
    private init() { }

    func deinitializeAPI() {
        DocReader.shared.deinitializeReader()
    }

    func initializeDatabaseAndAPI(progress: @escaping (State) -> Void) {
        guard let dataPath = Bundle.main.path(forResource: "regula.license", ofType: nil) else {
            progress(.error("Missing Licence File in Bundle11111"))
            return
        }
        guard let licenseData = try? Data(contentsOf: URL(fileURLWithPath: dataPath)) else {
            progress(.error("Missing Licence File in Bundle22222"))
            return
        }

        DispatchQueue.global().async {
            DocReader.shared.prepareDatabase(
                databaseID: self.kRegulaDatabaseId,
                progressHandler: { (inprogress) in
                    progress(.downloadingDatabase(progress: inprogress.fractionCompleted))
                },
                completion: { (success, error) in
                    if let error = error, !success {
                        progress(.error("Database error: \(error.localizedDescription)"))
                        return
                    }
                    let config = DocReader.Config(license: licenseData)
                    DocReader.shared.initializeReader(config: config, completion: { (success, error) in
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
            )
        }
        
    }
}

