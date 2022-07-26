//
//  AccountInfoModel.swift
//  EthereumWallet
//
//  Created by Nancy T on 2022/7/23.
//

import Foundation

struct AccountInfoModel : Codable {
    var avatar: String    //用户头像
    var name: String      //用户名称
    var balance_USD: Int  //美元计算余额
    var address: String   //地址
}
