# EthereumWallet App(SwiftUI)

该Demo包括首页、发送页、扫描页 三个页面

## 项目架构：
1. 使用MVVM分层架构，满足高内聚低耦合，包括view，viewModel（WalletRequest），model，网络层  
2. 部分UI和方法构建成可复用组件，比如NavigationBarView
## 功能实现：
1. 实现了页面的两种进入方式：发送页面的push/pop方式和扫描页面的present和dismiss方式

## 应用详情：
### 首页：
1. 实现页面布局，根据业务功能合理划分为不同的子视图，各自单独实现，最后组合成为首页
2. 实现列表数据交互，获取网络数据，并且列表显示
### 扫描页：
1. 实现页面布局
2. SwiftUI调用UIKit（CameraView是由UIKit封装而来）
### 发送页：
1. 实现页面布局



