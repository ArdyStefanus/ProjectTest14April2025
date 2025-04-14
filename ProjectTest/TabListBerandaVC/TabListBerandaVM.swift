//
//  TabListBerandaVM.swift
//  ProjectTest
//
//  Created by Macbook Pro on 14/04/25.
//

class TabListBerandaClaimVM {
    let listClaimService = ClaimListService.shared
    var loading: Observable<Bool> = Observable(false)
    var arrListClaim: Observable<[ClaimListModel]> = Observable([])
    var searchFilterClaim: Observable<[ClaimListModel]> = Observable([])
    
    func getAvailableGameList() {
        self.loading.value = true
        listClaimService.getAvailableListClaim { [unowned self] (data) in
            self.arrListClaim.value = []
            for i in 0 ..< data.count {
                self.arrListClaim.value.append(ClaimListModel.init(data: data[i]))
            }
            self.loading.value = false
        }
    }
}
