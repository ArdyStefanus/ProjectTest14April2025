//
//  ClaimModel.swift
//  ProjectTest
//
//  Created by Macbook Pro on 14/04/25.
//

import SwiftyJSON

struct ClaimListModel {
    var ClaimantID: Int
    var ClaimID: Int
    var ClaimTitle: String
    var ClaimDescription: String
    
    init(data: JSON) {
        self.ClaimantID = data["userId"].int ?? 0
        self.ClaimID = data["id"].int ?? 0
        self.ClaimTitle = data["title"].string ?? "-"
        self.ClaimDescription = data["body"].string ?? "-"
    }
}
