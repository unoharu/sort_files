#!/bin/bash

# .envファイルを読み込む
set -a
source "$(dirname "$0")/.env"
set +a

# ファイルを日付ごとに整理する関数
organize_files_by_date() {
    for file in "$TARGET_DIR"/*; do
        if [ -f "$file" ]; then
            # ファイルの作成日を取得
            creation_date=$(stat -f "%SB" -t "%Y-%m-%d" "$file")
            # 日付ディレクトリが存在しない場合は作成
            mkdir -p "$TARGET_DIR/$creation_date"
            # ファイルを日付ディレクトリに移動
            mv "$file" "$TARGET_DIR/$creation_date/"
        fi
    done
}

organize_files_by_date