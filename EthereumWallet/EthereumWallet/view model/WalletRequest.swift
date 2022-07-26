//
//  WalletRequest.swift
//  EthereumWallet
//
//  Created by Nancy T on 2022/7/25.
//

import SwiftUI

class WalletRequest: ObservableObject {
    
    static let shared = WalletRequest()
    private init() {}
        
    @Published var isRequesting = false
    @Published var coinDatas: [CoinModel] = [CoinModel]()
    
    func requestCoinInfo() {
        guard let url = URL(string: "https://data.messari.io/api/v1/assets?fields=id,slug,symbol,metrics/market_data/price_usd")
        else {return}
        isRequesting = true
        NetworkApi.get(url, nil, CoinListModel.self) { data, error in
            self.isRequesting = false
            guard error == nil, let items = data?.data
            else {return}
            self.coinDatas = items
        }
    }
}
