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
        searchBar.resignFirstResponder()
        searchBar.isUserInteractionEnabled = true
        searchBar.delegate = self
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
        
        vm.arrListClaim.bind { [unowned self] (_) in
            self.vm.searchFilterClaim.value = self.vm.arrListClaim.value
            self.tableViewListClaim.reloadData()
        }
    }
}

extension TabListBerandaVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.searchFilterClaim.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NibFile.LIST_CLAIM_CELL, for: indexPath) as! ListClaimCell
        let data = vm.searchFilterClaim.value[indexPath.row]
        cell.setupCell(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailListClaimVC(nibName: NibFile.DETAIL_CLAIM, bundle: nil)
        vc.vm.title = vm.searchFilterClaim.value[indexPath.row].ClaimTitle
        vc.vm.desc = vm.searchFilterClaim.value[indexPath.row].ClaimDescription
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension TabListBerandaVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            vm.searchFilterClaim.value = vm.arrListClaim.value
        } else {
            vm.searchFilterClaim.value = vm.arrListClaim.value.filter {
                // Case insensitive logic search
                $0.ClaimTitle.lowercased().contains(searchText.lowercased())
            }
            tableViewListClaim.reloadData()
        }
    }
}
