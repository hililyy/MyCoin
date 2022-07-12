//
//  CoinDetailVC.swift
//  coin
//
//  Created by 강조은 on 2022/07/12.
//

import UIKit

class CoinDetailVC: UIViewController {
    @IBOutlet weak var coinId: UILabel!
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var coinDescription: UILabel!
    @IBOutlet weak var coinSymbol: UILabel!
    @IBOutlet weak var coinRank: UILabel!
    @IBOutlet weak var coinActive: UILabel!
    @IBOutlet weak var coinTagsTableView: UITableView!
    @IBOutlet weak var coinTeamTableView: UITableView!
    
    let model = CoinDetailViewModel.viewModel
    var selectedIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.requestCoinDetailData(selectedIndex: selectedIndex ?? 0)
        self.coinTagsTableView.dataSource = self
        self.coinTagsTableView.delegate = self
        self.coinTeamTableView.dataSource = self
        self.coinTeamTableView.delegate = self
    }
    
    @IBAction func reloadData(_ sender: Any) {
        model.reciveCoinDetailData()
        self.loadView()
    }
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension CoinDetailVC:UITableViewDelegate,  UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ((model.getCoinDetailData().id?.isEmpty) != nil) {
            return 0
        } else {
            if tableView == coinTagsTableView {
                return 1
            } else if tableView == coinTeamTableView {
                return 1
            }
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == coinTagsTableView {
            let cell = coinTagsTableView.dequeueReusableCell(withIdentifier: "CoinDetailTagsTableViewCell", for: indexPath) as! CoinDetailTagsTableViewCell
            
            guard let coinCounter = model.getCoinDetailData().tags?[indexPath.row].coun_counter else {return cell}
            guard let icoCounter = model.getCoinDetailData().tags?[indexPath.row].ico_counter else {return cell}
            
            cell.tagsId.text = model.getCoinDetailData().tags?[indexPath.row].id
            cell.tagsName.text = model.getCoinDetailData().tags?[indexPath.row].name
            cell.tagsCoinCounter.text = String(coinCounter)
            cell.tagsIcoCounter.text = String(icoCounter)
            return cell
            
        } else {
            let cell = coinTagsTableView.dequeueReusableCell(withIdentifier: "CoinDetailTeamTableViewCell", for: indexPath) as! CoinDetailTeamTableViewCell
            
            cell.teamId.text = model.getCoinDetailData().team?[indexPath.row].id
            cell.teamName.text = model.getCoinDetailData().team?[indexPath.row].name
            cell.teamPositiom.text = model.getCoinDetailData().team?[indexPath.row].position
            return cell
        }
    }
}
