//
//  ListClaimCell.swift
//  ProjectTest
//
//  Created by Macbook Pro on 14/04/25.
//

import UIKit

class ListClaimCell: UITableViewCell {

    @IBOutlet weak var titleClaim: UILabel!
    @IBOutlet weak var descClaim: UILabel!
    @IBOutlet weak var claimID: UILabel!
    @IBOutlet weak var claimantID: UILabel!
    
    func setupCell(data: ClaimListModel){
        titleClaim.text = data.ClaimTitle
        descClaim.text = data.ClaimDescription
        claimID.text = "\(data.ClaimID)"
        claimantID.text = "\(data.ClaimantID)"
    }
}
