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

- GNS3 APIサーバを起動する  

![gns3](https://user-images.githubusercontent.com/24976921/32733485-b856c560-c8d2-11e7-9921-ecc873bc289d.png)


- Webアプリを起動する
`ruby main.rb -o 0.0.0.0`


