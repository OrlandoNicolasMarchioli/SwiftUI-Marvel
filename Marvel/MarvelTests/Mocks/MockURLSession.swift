////
////  MockURLSession.swift
////  MarvelTests
////
////  Created by Orlando Nicolas Marchioli on 17/04/2024.
////
//
//import Foundation
//
//protocol URLSessionDataTaskProtocol {
//    func resume()
//}
//
//protocol URLSessionProtocol {
//    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
//}
//
//class MockURLSession: URLSessionProtocol {
//    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
//        <#code#>
//    }
//    
//    var data: Data?
//    var error: Error?
//    var completion: ((Data?, URLResponse?, Error?) -> Void)?
//    
//    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        self.completion = completionHandler
//        return MockURLSessionDataTask(completion: completionHandler, data: data, error: error)
//    }
//    
//    func completeRequest() {
//        completion?(data, nil, error)
//    }
//}
//
//class MockURLSessionDataTask: URLSessionDataTask {
//    var completion: (Data?, URLResponse?, Error?) -> Void
//    var data: Data?
//    var error: Error?
//    
//    init(completion: @escaping (Data?, URLResponse?, Error?) -> Void, data: Data?, error: Error?) {
//        self.completion = completion
//        self.data = data
//        self.error = error
//    }
//    
//    override func resume() {
//        // Simulate asynchronous completion
//        DispatchQueue.global().async {
//            self.completion(self.data, nil, self.error)
//        }
//    }
//}
//
