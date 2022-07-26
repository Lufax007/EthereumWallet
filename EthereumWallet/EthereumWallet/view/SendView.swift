//
//  BuyView.swift
//  EthereumWallet
//
//  Created by Nancy T on 2022/7/24.
//

import SwiftUI

struct SendView: View {
    @State var address: String = ""
    @State var num: String = ""
    let navgationModel = NavgationBarModel(title: "发送", leftIcon: "chevron.backward", rightIcon: "")
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                NavigationBarView(model: navgationModel) { isRight in
                   if !isRight {
                       self.presentationMode.wrappedValue.dismiss()
                   }
                }
                
                HStack {
                    TextField("查找、公用地址（0x）或ENS", text:$address)
                        .textInputAutocapitalization(.never)
                        .font(.system(size: 16)).padding()
                    Spacer()
                    Image(systemName: "qrcode.viewfinder").font(.title).padding().foregroundColor(Color(hex:0x1c86ee))
                }.padding(20)
                
                HStack {
                    Text("资产:").foregroundColor(.black).font(.system(size: 14)).frame(width: 70)
                    HStack {
                        Image("myAvatar").resizable()
                            .frame(width: 32, height: 32, alignment: .center)
                            .background(Circle().stroke(Color(hex:0x1c86ee), lineWidth: 1)).scaledToFill()
                            .clipShape(Circle())
                        VStack(alignment: .leading, spacing: 8) {
                            Text("ETH").foregroundColor(.black).font(.system(size: 14))
                            Text("余额: 0 ETH").foregroundColor(.gray).font(.system(size: 14))
                        }
                    }.frame(width: UIScreen.main.bounds.width-140, height: 40, alignment: .leading)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }/*.background(Color.red)*/
                    
                HStack {
                    Text("数额:").foregroundColor(.black).font(.system(size: 14)).frame(width: 70)
                    VStack {
                        TextField("0 USD", text:$num)
                            .textInputAutocapitalization(.never)
                            .textFieldStyle(PlainTextFieldStyle())
                            .keyboardType(.numberPad)
                            .font(.system(size: 16)).padding()
                    }.frame(width: UIScreen.main.bounds.width-140, height: 40, alignment: .leading)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("OK")
                }
                Spacer()
            }.textFieldStyle(.roundedBorder).navigationBarHidden(true)
        }
    }
    
}
