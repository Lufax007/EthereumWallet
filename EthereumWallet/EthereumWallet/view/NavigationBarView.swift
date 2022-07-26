//
//  NavigationBarView.swift
//  EthereumWallet
//
//  Created by Nancy T on 2022/7/23.
//

import SwiftUI

struct NavigationBarView: View {
    
    let model: NavgationBarModel
    var onClickedBarButton: (_ isRight: Bool)->()
    
    var body: some View {
        ZStack(alignment: .center) {
            HStack {
                Button(action:{
                    onClickedBarButton(false)
                }){
                    Image(systemName: model.leftIcon).font(.title)
                }.padding(20)
                Spacer()
            }
            VStack {
                Spacer()
                Text(model.title).font(.system(size: 18)).foregroundColor(.black)
                HStack {
                    Spacer()
                    Image(systemName: "circle.fill").font(.system(size: 5)).foregroundColor(.green)
                    Button(action: {/*switch network view*/}) {
                        Text("Etherem Main Network").font(.system(size: 14)).foregroundColor(.black)
                    }
                    Spacer()
                }
                Spacer()
            }
            HStack {
                Spacer()
                Button(action:{
                    onClickedBarButton(true)
                }) {
                    Image(systemName: model.rightIcon).font(.title)
                }.padding(20)
            }
        }.frame(height: 44).accentColor(Color(hex:0x1c86ee))
    }
}
