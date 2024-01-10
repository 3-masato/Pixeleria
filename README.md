# Pixeleria

<div style="display: flex; gap: 0.25rem;">

  ![HTML](https://img.shields.io/badge/HTML-%23E34F26?logo=html5&logoColor=%23e5e7eb "HTML")
  ![CSS](https://img.shields.io/badge/CSS-%231572B6?logo=css3&logoColor=%23e5e7eb "CSS")
  ![JavaScript](https://img.shields.io/badge/JavaScript-%23323230?logo=javascript "JavaScript")
  ![TypeScript](https://img.shields.io/badge/TypeScript-%233178C6?logo=typescript&logoColor=%23FFFFFF "TypeScript")
  ![Ruby](https://img.shields.io/badge/Ruby-%23CC342D?logo=ruby "Ruby")
  ![Ruby on Rails](https://img.shields.io/badge/Ruby%20on%20Rails-%23D30001?logo=rubyonrails "Ruby on Rails")
  ![Tailwind CSS](https://img.shields.io/badge/Tailwind%20CSS-%23334155?logo=tailwindcss "Tailwind CSS")
  ![Stimulus](https://img.shields.io/badge/Stimulus-%2377E8B9?logo=stimulus&logoColor=%23000000 "Stimulus")
  ![jQuery](https://img.shields.io/badge/jQuery-%230769AD?logo=jquery&logoColor=%23000000 "jQuery")
  ![MySQL](https://img.shields.io/badge/MySQL-%234479A1?logo=mysql&logoColor=%23ffffff "MySQL")
  ![nginx](https://img.shields.io/badge/nginx-%234479A1?logo=nginx&logoColor=%23ffffff "nginx")
  ![AWS](https://img.shields.io/badge/AWS-%23232F3E?logo=amazonaws&logoColor=%23FF9900 "AWS")

</div>

## サイト概要

### サイトテーマ

ドット絵の作成と共有を可能にするクリエイティブなコミュニティサービスです。
ユーザーは他の人々のドット絵作品を閲覧したり、簡単な操作で自分自身のドット絵を描くことができます。

![エディタのスクリーンショット](https://raw.githubusercontent.com/3-masato/Pixeleria/main/application_spec/screen.png "エディタのスクリーンショット")

### テーマを選んだ理由

デフォルメされた愛らしさと、高い抽象度が生み出す曖昧さの味わい深さに惹かれました。
この親しみやすさと独特な美しさを多くの人と共有し、自分の作品を手軽に創造できるサービスがあれば素晴らしいと思い、このポートフォリオのテーマを選択しました。

### ターゲットユーザ

- ドット絵を愛する人々
- 様々なドット絵作品を見たいと思っている人々
- 手軽にドット絵を描きたい人々
- 自分の作品を共有したいと考えているクリエイター

### 主な利用シーン

- 急に思い立ってドット絵を描きたくなったとき
- 好きなドット絵を探しているとき
- ドット絵の描画技術を練習したいとき

## 設計書

- **ER図**
  ![PixeleriaのER図](https://raw.githubusercontent.com/3-masato/Pixeleria/main/application_spec/assets/Pixeleria_ER_diagram_v3.png "ER図")
- **[インフラ設計書](https://docs.google.com/spreadsheets/d/1w5kE9Cck15UpGISQLlzqqJhV8B3wSsnTW6B9j5wE2uQ/edit#gid=0)**
- **AWS構成図**
  ![AWS構成図](https://raw.githubusercontent.com/3-masato/Pixeleria/main/application_spec/assets/AWS%20Network%20Diagram.png "AWS構成図")

## 機能

- ドット絵エディタ
  - 描画ツール(ペン・塗りつぶし・消しゴム)
  - カラーパレット
  - グリッドの表示/非表示
  - 描画内容のクリア
  - プレビュー
  - サイズ変更
  - 描いたドット絵の編集
- 新規登録、ログイン、ログアウト、ゲストログイン、退会
- アカウント情報編集
- フォロー機能
- いいね機能
- コメント機能
- キーワード検索機能(タイトル or 説明文から検索)
- タグ絞り込み機能
- 通報機能

## 使用技術

### メインアプリケーション

- HTML
- CSS
- JavaScript
- TypeScript
- TailwindCSS
- Ruby
- SQL
- Ruby on Rails
- Stimulus
- jQuery

ドット絵エディタはサブモジュールとして別々に実装しています：
[Pixeleria-Editor](https://github.com/3-masato/Pixeleria-Editor)

## 今後の課題

- ドット絵エディタ使用中、ページ離脱時にアラートを出す
- ドット絵エディタのサイズ変更時にアラートを出す
- ドット絵エディタのレスポンシブ対応
- メインビジュアル
- jQueryからStimulusへの移行
