//
//  RESTAPI.swift
//  ToolBox
//

import Foundation

public protocol RESTAPI {
  var path: String { get }
  var method: String { get }
  var headers: [String: String]? { get }
  var body: Data? { get }
}

public extension RESTAPI {
  func urlRequest(baseURL: String) -> URLRequest? {
    guard let url = URL(string: baseURL + path) else { return nil }
    var request = URLRequest(url: url)
    request.httpMethod = method
    request.allHTTPHeaderFields = headers
    request.httpBody = body
    return request
  }
}
