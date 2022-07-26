//
//  ContentView.swift
//  EthereumWallet
//
//  Created by Nancy T on 2022/7/23.
//

import SwiftUI

struct HomePage: View
{
    let navgationModel = NavgationBarModel(title: "Wallet", leftIcon: "line.horizontal.3", rightIcon: "qrcode.viewfinder")
    
    @State private var selectedIndex: Int = 0
    @State private var scanKey = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    NavigationBarView(model:navgationModel) { isRight in
                        if isRight {
                            self.scanKey.toggle()
                        }
                    }
                    AccountView()
                    CoinListSwitchView(switchIndex: $selectedIndex)
                    Spacer().navigationBarHidden(true)
                }
                .fullScreenCover(isPresented: $scanKey, content: {
                    ScannerView()
                })
            }
        }.navigationBarHidden(true)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
