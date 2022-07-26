//
//  AccountView.swift
//  EthereumWallet
//
//  Created by Nancy T on 2022/7/23.
//

import SwiftUI

private let menuItems = [
    MenuItem(image: "arrow.down.to.line.alt", text: "接收"),
    MenuItem(image: "creditcard", text: "购买"),
    MenuItem(image: "arrow.up.right", text: "发送"),
    MenuItem(image: "arrow.left.arrow.right", text: "兑换")
]

struct MenuView: View {
    var model: MenuItem
    var body: some View {
        VStack {
            Image(systemName: model.image).resizable()
                .frame(width: 18, height: 18, alignment: .center)
                .padding(16)
                .background(Color(hex:0x1c86ee)).cornerRadius(40).foregroundColor(.white)
            
            Text(model.text).font(.system(size: 15))
        }
    }
}

struct AccountView: View {
    var model : AccountInfoModel = AccountInfoModel(avatar:"myAvatar", name: "mayboa", balance_USD: 1500, address: "0xeb645f2fc7085b2e66c27f6ac5474e344148dca1")
    
    var infoView: some View {
        VStack(alignment: .center, spacing: 16) {
            Image(model.avatar).resizable()
                        .frame(width: 64, height: 64, alignment: .center)
                        .background(Circle().stroke(Color(hex:0x1c86ee), lineWidth: 2)).scaledToFill()
                        .clipShape(Circle())
            
            Text(model.name).font(.system(size: 20)).foregroundColor(Color(hex:0x262626))
            Text(String(format:"$%d USD", arguments: [model.balance_USD])).font(.system(size: 15)).foregroundColor(Color(hex:0xa6a6a6))
            Text(model.address)
                .frame(width: 200, height: 30, alignment: .center)
                .font(.callout)
                .lineLimit(1)
                .truncationMode(.middle)
                .foregroundColor(.gray)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Capsule().fill(Color.blue.opacity(0.1)))
        }
    }
    
    var operationPanelView: some View {
        HStack(spacing: 18) {
            ForEach(menuItems) {item in
                if item.text == "发送" {
                    NavigationLink {
                        SendView()
                    } label: {
                        MenuView(model: item)
                    }
                }
                else {
                    MenuView(model: item)
                }
            }
        }
    }
    
    var body: some View {
            VStack(alignment: .center, spacing: 16) {
                infoView
                operationPanelView.padding(.bottom, 20)
            }
    }
}
