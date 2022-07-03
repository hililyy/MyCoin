//
//  CoinListCollectionVC.swift
//  coin
//
//  Created by 강조은 on 2022/07/04.
//

import UIKit
import Lottie

class CoinListCollectionVC: UIViewController {
    @IBOutlet var lottieView: UIView!
    @IBOutlet var newCoinBtn: UIButton!
    @IBOutlet var activeCoinBtn: UIButton!
    @IBOutlet var reloadBtn: UIButton!
    @IBOutlet var coinCollectionView: UICollectionView!
    
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
        self.coinCollectionView.delegate = self
        self.coinCollectionView.dataSource = self
        
        newCoinBtn.isEnabled = false
        activeCoinBtn.isEnabled = false
    }
    @IBAction func reloadData(_ sender: UIButton) {
        reloadBtn.alpha = 0.5
        model.reciveData()
        coinCollectionView.reloadData()
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
        coinCollectionView.reloadData()
        print("newCoinBtnInfo: \(newCoinBtnInfo)")
        print("activeCoinBtnInfo: \(activeCoinBtnInfo)")
    }
}
extension CoinListCollectionVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if model.coinListData.isEmpty {
            return 0
        }
        else {return 20000}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = coinCollectionView.dequeueReusableCell(withReuseIdentifier: "CoinListCollectionViewCell", for: indexPath) as! CoinListCollectionViewCell
        
        guard
            let rank = model.coinListData[indexPath.row].rank
        else {return cell}
        
//        if model.coinListData[indexPath.row].is_active == true {
//            cell.activeIcon.isHidden = false
//
//        }
//        if model.coinListData[indexPath.row].is_new == true {
//            cell.newIcon.isHidden = false
//        }
        
        cell.coinName.text = model.coinListData[indexPath.row].name
        cell.coinSymbol.text = model.coinListData[indexPath.row].symbol
        cell.coinRank.text = String(rank)
        
        return cell
    }
    
    
}
