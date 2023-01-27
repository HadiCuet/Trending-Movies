//
//  HTTPError.swift
//  Trending Movies
//
//  Created by Abdullah Al Hadi on 27/1/23.
//

public enum HTTPError: String, Error {

    case success             = "Successful Network Request"
    case parametersNil       = "Error Found : Parameters are nil."
    case headersNil          = "Error Found : Headers are Nil"
    case encodingFailed      = "Error Found : Parameter Encoding failed."
    case decodingFailed      = "Error Found : Unable to Decode the data."
    case missingURL          = "Error Found : The URL is nil."
    case couldNotParse       = "Error Found : Unable to parse the JSON response."
    case noData              = "Error Found : The data from API is Nil."
    case FragmentResponse    = "Error Found : The API's response's body has fragments."
    case UnwrappingError     = "Error Found : Unable to unwrape the data."
    case dataTaskFailed      = "Error Found : The Data Task object failed."
    case authenticationError = "Error Found : You must be Authenticated"
    case badRequest          = "Error Found : Bad Request"
    case pageNotFound        = "Error Found : Page/Route rquested not found."
    case failed              = "Error Found : Network Request failed"
    case serverSideError     = "Error Found : Server error"
}
