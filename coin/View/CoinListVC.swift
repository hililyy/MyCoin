//
//  CoinListVC.swift
//  MyCoin
//
//  Created by 강조은 on 2022/06/28.
//

import UIKit
import Lottie

class CoinListVC: UIViewController {
    
    @IBOutlet weak var lottieView: UIView!
    @IBOutlet weak var newCoinBtn: UIButton!
    @IBOutlet weak var activeCoinBtn: UIButton!
    @IBOutlet weak var coinListTableView: UITableView!
    @IBOutlet weak var reloadBtn: UIButton!
    @IBOutlet weak var sectionView: UIView!
    
    let model = CoinListViewModel.viewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.apiRequest()
        lottieInit()
        btnBorderInit()
        initalize()
        coinListTableView.delegate = self
        coinListTableView.dataSource = self
    }
    
    func btnBorderInit() {
        newCoinBtn.layer.cornerRadius = 20
        activeCoinBtn.layer.cornerRadius = 20
        sectionView.layer.cornerRadius = 15
        sectionView.layer.borderColor = UIColor(named: "mainColor")?.cgColor
        sectionView.layer.borderWidth = 1.5
    }
    
    func initalize() {
        newCoinBtn.isEnabled = false
        activeCoinBtn.isEnabled = false
    }
    
    func lottieInit() {
        let animationView = AnimationView(name: "coin")
        self.view.addSubview(animationView)
        
        animationView.frame = self.lottieView.bounds
        animationView.center = self.lottieView.center
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 0.7
        animationView.play()
        animationView.loopMode = .loop
    }
    
    @IBAction func reloadData(_ sender: UIButton) {
        reloadBtn.alpha = 0.5
        model.reciveData()
        coinListTableView.reloadData()
        newCoinBtn.isEnabled = true
        activeCoinBtn.isEnabled = true
    }

    @IBAction func touchCoinBtn(_ sender: UIButton) {
        switch sender {
        case self.newCoinBtn:
            model.newCoinBtnInfo = !model.newCoinBtnInfo
            newCoinBtn.alpha = model.newCoinBtnInfo == true ? 1.0 : 0.5
            
        case self.activeCoinBtn:
            model.activeCoinBtnInfo = !model.activeCoinBtnInfo
            activeCoinBtn.alpha = model.activeCoinBtnInfo == true ? 1.0 : 0.5
            
        default:
            break
        }
        coinListTableView.reloadData()
    }
}

extension CoinListVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if model.getCoinListData().isEmpty {
            return 0
        }
        else {return 5000}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = coinListTableView.dequeueReusableCell(withIdentifier: "CoinListTableViewCell", for: indexPath) as! CoinListTableViewCell
        
        guard
            let rank = model.getCoinListData()[indexPath.row].rank
        else {return cell}
        
        if model.getCoinListData()[indexPath.row].is_active == true {
            cell.activeIcon.isHidden = false
        }
        if model.getCoinListData()[indexPath.row].is_new == true {
            cell.newIcon.isHidden = false
        }

        cell.coinName.text = model.getCoinListData()[indexPath.row].name
        cell.coinSymbol.text = model.getCoinListData()[indexPath.row].symbol
        cell.coinRank.text = String(rank)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.model.settingCoinCategory(indexPath: indexPath.row)
    }
}
