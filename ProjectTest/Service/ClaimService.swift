//
//  ClaimService.swift
//  ProjectTest
//
//  Created by Macbook Pro on 14/04/25.
//

import Alamofire
import SwiftyJSON

class ClaimListService {
    static let shared = ClaimListService()
    
    func getAvailableListClaim(completion: @escaping ([JSON]) -> ()) {
        let request: URLRequest = RESTConfig.shared.requestConfig(endpoint: CLAIM_BASE_SERVER, method: RESTConfig.HTTPMethod.GET, parameters: nil)
        
        AF.request(request).response { response in
            switch response.result {
            case .success:
                let json = JSON(response.data!)
                let data = json.array ?? []
                completion(data)
            case .failure:
                print(response.debugDescription)
            }
        }
    }
}
