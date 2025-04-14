//
//  DetailListClaimVC.swift
//  ProjectTest
//
//  Created by Macbook Pro on 14/04/25.
//

import UIKit

class DetailListClaimVC: UIViewController {

    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var descDetail: UILabel!
    
    let vm = DetailListClaimVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleDetail.text = vm.title
        descDetail.text = vm.desc
    }

    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
