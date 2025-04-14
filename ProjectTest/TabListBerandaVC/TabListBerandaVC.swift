//
//  TabListBerandaVC.swift
//  ProjectTest
//
//  Created by Macbook Pro on 14/04/25.
//

import UIKit

class TabListBerandaVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableViewListClaim: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    let vm = TabListBerandaClaimVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        vm.getAvailableGameList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupView(){
        tableViewListClaim.delegate = self
        tableViewListClaim.dataSource = self
        tableViewListClaim.register(UINib.init(nibName: NibFile.LIST_CLAIM_CELL, bundle: nil), forCellReuseIdentifier: NibFile.LIST_CLAIM_CELL)
        
        bind()
    }
    
    func bind() {
        vm.loading.bind { [weak self] loading in
            if loading { self?.loadingIndicator.startAnimating() }
            else { self?.loadingIndicator.stopAnimating() }
        }
        
        vm.arrListClaim.bind { [weak self] (_) in
            self?.tableViewListClaim.reloadData()
        }
    }
}

extension TabListBerandaVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.arrListClaim.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NibFile.LIST_CLAIM_CELL, for: indexPath) as! ListClaimCell
        let data = vm.arrListClaim.value[indexPath.row]
        cell.setupCell(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailListClaimVC(nibName: NibFile.DETAIL_CLAIM, bundle: nil)
        vc.vm.title = vm.arrListClaim.value[indexPath.row].ClaimTitle
        vc.vm.desc = vm.arrListClaim.value[indexPath.row].ClaimDescription
        navigationController?.pushViewController(vc, animated: true)
    }
}
