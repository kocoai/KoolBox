//
//  WebService.swift
//  ToolBox
//

import Foundation
import Combine

public protocol WebService {
  var session: URLSession { get }
  var baseURL: String { get }
}

public extension WebService {
  func perform<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Error> {
    session
      .dataTaskPublisher(for: request)
      .map { $0.data }
      .decode(type: T.self, decoder: decoder)
      .eraseToAnyPublisher()
  }
  
  func call<T: Decodable>(endpoint: RESTAPI, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Error> {
    endpoint.urlRequest(baseURL: baseURL)
      .publisher
      .flatMap { perform($0, decoder) }
      .eraseToAnyPublisher()
  }
}
