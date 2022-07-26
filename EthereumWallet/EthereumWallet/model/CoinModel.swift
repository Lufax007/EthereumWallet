//
//  CoinModel.swift
//  EthereumWallet
//
//  Created by Nancy T on 2022/7/25.
//

import Foundation


struct CoinMetricsDataModel: Codable {
    var price_usd: Float
}

struct CoinMetricsModel: Codable {
    var market_data: CoinMetricsDataModel
}

struct CoinModel: Codable,Identifiable {
    var id = UUID().uuidString
    var slug: String
    var symbol: String
    var metrics: CoinMetricsModel
}

struct CoinStatusModel: Codable {
    var elapsed: Int
    var timestamp: String
}

struct CoinListModel: Codable {
    var status: CoinStatusModel
    var data: [CoinModel]
}
