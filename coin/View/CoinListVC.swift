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
    
    var newCoinBtnInfo: Bool = true
    var activeCoinBtnInfo: Bool = true
    
    let model = CoinListModel.model
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.apiRequest()
        
        let animationView = AnimationView(name: "coin")
        self.view.addSubview(animationView)
        
        animationView.frame = self.lottieView.bounds
        animationView.center = self.lottieView.center
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 0.7
        animationView.play()
        animationView.loopMode = .loop
        
        newCoinBtn.layer.cornerRadius = 20
        activeCoinBtn.layer.cornerRadius = 20
        coinListTableView.delegate = self
        coinListTableView.dataSource = self
        sectionView.layer.cornerRadius = 15
        sectionView.layer.borderColor = UIColor(named: "mainColor")?.cgColor
        sectionView.layer.borderWidth = 1.5
        
        newCoinBtn.isEnabled = false
        activeCoinBtn.isEnabled = false
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
            newCoinBtnInfo = !newCoinBtnInfo
            newCoinBtn.alpha = newCoinBtnInfo == true ? 1.0 : 0.5
            
        case self.activeCoinBtn:
            activeCoinBtnInfo = !activeCoinBtnInfo
            activeCoinBtn.alpha = activeCoinBtnInfo == true ? 1.0 : 0.5
            
        default:
            break
        }
        coinListTableView.reloadData()
        print("newCoinBtnInfo: \(newCoinBtnInfo)")
        print("activeCoinBtnInfo: \(activeCoinBtnInfo)")
    }
}

extension CoinListVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if model.coinListData.isEmpty {
            return 0
        }
        else {return 5000}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = coinListTableView.dequeueReusableCell(withIdentifier: "CoinListTableViewCell", for: indexPath) as! CoinListTableViewCell
        
        guard
            let rank = model.coinListData[indexPath.row].rank
        else {return cell}
        
        if model.coinListData[indexPath.row].is_active == true {
            cell.activeIcon.isHidden = false
        }
        if model.coinListData[indexPath.row].is_new == true {
            cell.newIcon.isHidden = false
        }
        
        cell.coinName.text = model.coinListData[indexPath.row].name
        cell.coinSymbol.text = model.coinListData[indexPath.row].symbol
        cell.coinRank.text = String(rank)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if model.coinListData[indexPath.row].type == "coin" {
            if self.activeCoinBtnInfo == true && self.newCoinBtnInfo == true {
                if model.coinListData[indexPath.row].is_active == true || model.coinListData[indexPath.row].is_new == true {
                    return 57
                } else {
                    return 0
                }
            } else if self.activeCoinBtnInfo == true && self.newCoinBtnInfo == false {
                if model.coinListData[indexPath.row].is_active == true && model.coinListData[indexPath.row].is_new == false {
                    return 57
                } else {
                    return 0
                }
            } else if self.activeCoinBtnInfo == false && self.newCoinBtnInfo == true {
                if model.coinListData[indexPath.row].is_active == false && model.coinListData[indexPath.row].is_new == true {
                    return 57
                } else {
                    return 0
                }
            } else if self.activeCoinBtnInfo == false && self.newCoinBtnInfo == false {
                if model.coinListData[indexPath.row].is_active == false && model.coinListData[indexPath.row].is_new == false {
                    return 57
                } else {
                    return 0
                }
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
}
