//
//  CoinListSwitchView.swift
//  EthereumWallet
//
//  Created by Nancy T on 2022/7/24.
//

import SwiftUI

private let switchItems = [
    SwitchItem(title: "代币", index: 0),
    SwitchItem(title: "收藏品", index: 1)
]

struct CoinListSwitchView: View {
    
    @Binding var switchIndex: Int
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                ForEach(0..<switchItems.count, id:\.self) { i in
                    VStack {
                        Text(switchItems[i].title)
                            .foregroundColor(switchIndex == i ? Color.accentColor : Color.gray)
                            .frame(maxWidth: .infinity,minHeight: 30)
                        if switchIndex == i {
                            Rectangle()
                                .fill(Color.accentColor)
                                .frame(height: 2)
                        } else {
                            Rectangle()
                                .fill(Color.clear)
                                .frame(height: 2)
                        }
                    }
                    .onTapGesture {
                        switchIndex = i
                    }
                }
            }
            TabView(selection: $switchIndex) {
                CoinListView().tag(0)
                NFTView().tag(1)
            }
            .tabViewStyle(
                PageTabViewStyle(indexDisplayMode: .never)
            )
        }
    }
}

struct CoinListView: View {
    @ObservedObject var requestModel = WalletRequest.shared
    private struct CoinItemView: View {
        let model: CoinModel
        var body: some View {
            HStack(spacing: 10) {
                Image("eth").resizable().frame(width: 40, height: 40, alignment: .center).padding(15)
                VStack(alignment: .leading, spacing: 10) {
                    Text(model.symbol)
                    Text("$ \(model.metrics.market_data.price_usd)")
                }
                Spacer()
            }
        }
    }
    
    var body: some View {
        ZStack {
            List (requestModel.coinDatas) { model in
                CoinItemView(model: model).listRowInsets(EdgeInsets())
            }.listStyle(.plain)
            .onAppear {
                getInfos()
            }
        }
    }
    
    func getInfos() {
        if requestModel.isRequesting {return}
        requestModel.requestCoinInfo()
    }
}

struct NFTView: View {
    var body: some View {
        VStack(spacing: 8) {
            Image("empty")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 18)
            
            Text("你还没有更多收藏品").font(.title2)
            
            
        }
    }
}
