//
//  ProjectTestTests.swift
//  ProjectTestTests
//
//  Created by Macbook Pro on 14/04/25.
//

import Testing
import Alamofire
import SwiftyJSON
@testable import ProjectTest

struct ProjectTestTests {
    
    // MARK: - Model Tests
    @Test func testClaimListModelInitialization() async throws {
        let jsonData = """
        {
            "userId": 1,
            "id": 101,
            "title": "Test Claim",
            "body": "Test Description"
        }
        """.data(using: .utf8)!
        let json = try! JSON(data: jsonData)
        
        let claimModel = ClaimListModel(data: json)
        
        #expect(claimModel.ClaimantID == 1, "ClaimantID should be 1")
        #expect(claimModel.ClaimID == 101, "ClaimID should be 101")
        #expect(claimModel.ClaimTitle == "Test Claim", "ClaimTitle should match")
        #expect(claimModel.ClaimDescription == "Test Description", "ClaimDescription should match")
    }
    
    @Test func testClaimListModelWithInvalidData() async throws {
        let jsonData = """
        {
            "invalid": "data"
        }
        """.data(using: .utf8)!
        let json = try! JSON(data: jsonData)
        
        let claimModel = ClaimListModel(data: json)
        
        #expect(claimModel.ClaimantID == 0, "ClaimantID should be 0 for invalid data")
        #expect(claimModel.ClaimID == 0, "ClaimID should be 0 for invalid data")
        #expect(claimModel.ClaimTitle == "-", "ClaimTitle should be '-' for invalid data")
        #expect(claimModel.ClaimDescription == "-", "ClaimDescription should be '-' for invalid data")
    }
    
    // MARK: - Service Tests
    @Test func testClaimListServiceSuccess() async throws {
        let service = ClaimListService.shared
        var result: [JSON] = []
        
        await withCheckedContinuation { continuation in
            service.getAvailableListClaim { claims in
                result = claims
                continuation.resume()
            }
        }
        #expect(!result.isEmpty, "Claims array should not be empty on success")
    }
}
