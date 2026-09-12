---
name: md-view-skill
description: >
  Markdown ファイルをターミナル上で読みやすくレンダリング表示する CLI スキル。
  glow (charmbracelet) を使う。エージェントが md を読み出すときは `-Raw` で
  プレーンテキスト整形、ユーザーに見せるときは `-Tui` でインタラクティブ表示。
  「md見て」「mdを表示」「マークダウン表示」「md render」「レンダリング」
  「mdファイル読み出し」「md読む」などのキーワードで発動。
  CLI: `~/.opencode/skills/md-view-skill/md-view.ps1`
---

# md-view — Markdown レンダラー (glow)

glow で md を色付きレンダリング表示する。

## 使い方

```powershell
# プレーンテキスト整形（エージェントの読み出し向け）
~/.opencode/skills/md-view-skill/md-view.ps1 -Path foo.md -Raw

# インタラクティブ表示（ユーザーが見る向け、ターミナル）
~/.opencode/skills/md-view-skill/md-view.ps1 -Path foo.md -Tui
```

## 表示モード

| モード | 動作 |
|--------|------|
| デフォルト / `-Raw` | `glow --style dark` 非対話・色付き整形（出力をそのまま返す） |
| `-Tui` | `glow -t` 対話式ビューア（q で終了、tab で単語、方向キーでスクロール） |

## フォールバック順

1. Windows 側 `glow`（winget: charmbracelet.glow）
2. WSL 側 `glow`（wslpath で変換して実行）
3. どちらも無い場合 → 素の `Get-Content`

## 依存

- glow 3.x（`winget install charmbracelet.glow` で導入済み）