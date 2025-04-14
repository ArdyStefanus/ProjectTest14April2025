//
//  RESTConfig.swift
//  ProjectTest
//
//  Created by Macbook Pro on 14/04/25.
//

import Foundation

struct RESTConfig{
    static let shared = RESTConfig()
    
    enum HTTPMethod: String {
        case POST = "POST"
        case GET = "GET"
        case PUT = "PUT"
        case DELETE = "DELETE"
    }
    
    func requestConfig(endpoint: String, method: HTTPMethod, parameters: [String:Any]?) -> URLRequest {
        var request = URLRequest(url: NSURL.init(string: endpoint)! as URL)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        if parameters != nil {
            request.httpBody = try! JSONSerialization.data(withJSONObject: parameters!, options: [])
        }
        
        return request
    }
}
