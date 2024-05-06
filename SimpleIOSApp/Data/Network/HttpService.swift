//
//  HttpService.swift
//  SimpleIOSApp
//
//  Created by Woojin on 4/30/24.
//

import Foundation
import Combine

class HttpService {
    private let baseUrl: String
    private let jsonDecoder = JSONDecoder()
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func request<T: Decodable>(path: String, method: HttpMethod, headers: [String : String] = [:], queryItems: [URLQueryItem] = []) -> AnyPublisher<T, Error> {
        guard var urlComponents = URLComponents(string: self.baseUrl) else {
            return Fail(error: HttpError.malformedURLString(urlString: self.baseUrl)).eraseToAnyPublisher()
        }
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            return Fail(error: HttpError.invalidURLComponents(urlComponents: urlComponents.debugDescription)).eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        for header in headers {
            urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                let statusCode = (response as! HTTPURLResponse).statusCode
                guard (200..<300).contains(statusCode) else {
                    throw HttpError.httpStatusError(statusCode: statusCode)
                }
                return data
            }
            .decode(type: T.self, decoder: self.jsonDecoder)
            .eraseToAnyPublisher()
    }
    
    enum HttpMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    enum HttpError: Error {
        case malformedURLString(urlString: String)
        case invalidURLComponents(urlComponents: String)
        case httpStatusError(statusCode: Int)
    }
}
