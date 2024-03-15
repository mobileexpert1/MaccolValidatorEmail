

Pod::Spec.new do |spec|
  spec.name         = "MaccolValidatorEmail"
  spec.version      = "1.0.0"
  spec.summary      = "this is the best framework."
  spec.description  = "it is to validate the email and password credentials using
regex."
spec.homepage     = "https://github.com/mobileexpert1/MaccolValidatorEmail/tree/main/MaccolValidatorEmail"
  spec.license =   "regula.license"
   spec.license      = "MIT "
  spec.author             = { "vishalkumar" => "vishal-kumar@cssoftsolutions.com"}
  spec.platform     = :ios, "13.0"
    spec.ios.deployment_target = '13.0'
spec.source       = { :git => "https://github.com/mobileexpert1/MaccolValidatorEmail.git", :tag => "#{spec.version}" }
spec.source_files  = 'MaccolValidatorEmail/*.swift', 'MaccolValidatorEmail/DatabaseDownloading.swift','MaccolValidatorEmail/DocumentReaderService.swift','MaccolValidatorEmail/regula.license', 'MaccolValidatorEmail/Certificates.bundle','MaccolValidatorEmail/CertificatesPA.bundle','MaccolValidatorEmail/CertificatesTA.bundle'
 spec.swift_version = '5.0'
 spec.dependency 'DocumentReader'
  
end
