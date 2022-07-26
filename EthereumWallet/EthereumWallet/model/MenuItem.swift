//
//  MenuItem.swift
//  EthereumWallet
//
//  Created by Nancy T on 2022/7/24.
//

import Foundation

struct MenuItem: Identifiable {
    let id = UUID().uuidString
    let image: String
    let text: String
}

struct SwitchItem: Identifiable {
    let id = UUID().uuidString
    let title: String
    let index: UInt
}
