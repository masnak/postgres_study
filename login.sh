#!/bin/bash

# 永続化ボリュームの名前を定義
PERSISTENT_VOLUME_NAME="postgres_db"

# コンテナ名を変数に格納
CONTAINER_NAME="postgres-con"

# コンテナが実行中かどうか確認
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    # コンテナにログイン
    docker exec -it $CONTAINER_NAME bash
else
    echo "エラー: コンテナ '$CONTAINER_NAME' は実行中ではありません。"
    exit 1
fi