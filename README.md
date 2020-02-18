# Bookstocks

## 概要

自分のお気に入りの小説の、お気に入りの一節を、「ひとこと」、「タグ」、「画像」を添えて投稿し、共有するサービスです。

## 主要機能

1.ログイン機能  
2.会員登録機能  
3.投稿機能  
4.画像アップロード機能  
5.タグ機能  
6.投稿検索機能  
7.ページネーション機能  
8.WebAPIによる自動書籍検索機能  
9.単体テスト  
10.結合テスト  
11.DBトランザクション制御機能  

## 使用技術

### インフラ
*AWS:EC2, RDS(MySQL), VPC, Route53*

*Webサーバー：nginx+unicorn*

### 使用言語、フレームワーク
Ruby, Ruby On Rails, HTML, CSS, Bootstrap, RSpec(テストフレームワーク）

### バージョン管理
Git, GitHub

### 主要Gem
kaminari(ページネーション機能）, Ransack(検索機能）, Carrierwave(画像投稿機能）, rmagick(画像リサイズ）...

### その他
楽天API


