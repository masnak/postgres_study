#!/bin/bash

# 永続化ボリュームの名前を定義
PERSISTENT_VOLUME_NAME="postgres_db"

# コンテナ名を変数に格納
CONTAINER_NAME="postgres-con"

# コンテナが存在し、稼働中かどうかをチェック
if docker ps | grep -q $CONTAINER_NAME; then
    echo "Container '$CONTAINER_NAME' is already running."
else
    # コンテナが存在するが停止中の場合、コンテナを起動
    if docker ps -a | grep -q $CONTAINER_NAME; then
        echo "Container '$CONTAINER_NAME' exists but stopped. Starting..."
        docker start $CONTAINER_NAME
    else
        # コンテナが存在しない場合、新しくコンテナを作成して起動
        echo "Starting new container '$CONTAINER_NAME'..."
        docker run -d \
        -p 15432:5432 \
        -v $PERSISTENT_VOLUME_NAME:/var/lib/postgresql/data \
        --name $CONTAINER_NAME postgres-img
    fi
fi

# コンテナにログイン
docker exec -it $CONTAINER_NAME psql -U postgres