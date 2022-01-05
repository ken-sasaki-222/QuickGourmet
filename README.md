![名称未設定 001](https://user-images.githubusercontent.com/61372276/148187991-fef48d40-0d68-4d15-a3f7-079fc0e62998.jpeg)
## アプリの概要
引っ越し先や、土地感覚の無い地域で飲食店検索に困ったことはありませんか？  
食いっくグルメはそんなあなたの問題を解決します。  

## アプリをインストール
[食いっくグルメ AppStore](https://apps.apple.com/us/app/食いっくグルメ/id1587448015)からインストール

## 機能一覧
- 位置情報許可機能
- トラッキング許諾機能
- 現在地から徒歩圏内の飲食店検索機能
- マップ機能
- ブックマーク機能
- ホットペッパーグルメ遷移機能
- 広告機能
- Twitterシェア機能
- レビュー機能
- お問い合わせ機能
- 開発者Twitter紹介機能
- ダークモード対応

## 開発内容
#### 概要
- 言語：Swift version 5.5
- フレームワーク：SwiftUI
- アーキテクチャ：MVVM + DIP
- バックエンド：Firebase（Firestore）
- API：ホットペッパーグルメAPI
- コード管理：SwiftLint、SwiftFormat
- テスト：XCTest

#### 利用したライブラリ
```
- AdSupport
- AppTrackingTransparency
- CoreLocation
- Firebase
- MapKit
- MessageUI
- NendAd
- StoreKit
- SafariServices
- SwiftUI
- XCTest
```

#### 利用したCocoaPods
```
  pod 'SwiftFormat'
  pod 'SwiftLint'
  pod 'NendSDK_iOS'
  pod 'Firebase/Crashlytics'
  pod 'FirebaseFirestore'
```

## 工夫したところ
![DIP](https://user-images.githubusercontent.com/61372276/148185117-7c328cec-e182-4cde-ab97-393a043c8c67.jpeg)
アーキテクチャに`MVVM + DIP（依存関係逆転の原則）`を採用することで、UI層とData層を分離させました。  
結果、ライブラリへの依存を最小限に抑えることができた点や、UnitTestが書きやすくなった点など、開発効率の向上に繋がりました。
また、今回リリースした`version 1.0.3`へのアップデートもスムーズにおこなえたことから、アプリの保守運用面においても今回採用したアーキテクチャが活かされたと思います。

## 今後の課題
技術のキャッチアップとして`Bitrise`を用いてCI/CD環境を構築していく予定です。

## 開発者の連絡先
[Twitter DM](https://twitter.com/ken_sasaki2) からご連絡ください。

↓開発者の活動リンク↓
https://linktr.ee/sasaki.ken
