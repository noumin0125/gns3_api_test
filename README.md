# GNS3_API_Test

## 機能

GNS3とAPI経由で以下の操作を行います。  
- プロジェクトとノード情報を取得し、一覧表示する  
- ノードの起動/停止する  

## 環境

Ruby 2.3  
sinatra 2.0.0  
GNS3 2.0.3

## 使用方法

- GNS3を起動し、APIサーバのIPアドレスとポート番号を確認する  
　
![gns3](https://user-images.githubusercontent.com/24976921/32733485-b856c560-c8d2-11e7-9921-ecc873bc289d.png)

- main.rbを編集する  
`  GNS3URL = 'http://<APIサーバのIPアドレス>:<ポート番号>/v2'`  

- Webアプリを起動する  
`ruby main.rb -o 0.0.0.0`  

- ブラウザでアクセスする  

`http://<sinatraサーバのIPアドレス>:4567/`  

![gns3_api_test_1](https://user-images.githubusercontent.com/24976921/32734156-8b1b0834-c8d4-11e7-9ada-722786b80ce0.png)
![gns3_api_test_2](https://user-images.githubusercontent.com/24976921/32734159-8c9ac6ae-c8d4-11e7-9162-bb1d4944f01d.png)

