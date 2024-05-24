#!/bin/bash

# 永続化ボリュームの名前を定義
PERSISTENT_VOLUME_NAME="postgres_db"

# Dockerボリュームのリストを取得し、永続化ボリュームが存在するかどうかをチェック
if docker volume ls -q | grep -q "$PERSISTENT_VOLUME_NAME"; then
    echo "Persistent volume $PERSISTENT_VOLUME_NAME exists."
else
    echo "Persistent volume $PERSISTENT_VOLUME_NAME does not exist. Creating..."
    docker volume create $PERSISTENT_VOLUME_NAME
fi

# Dockerイメージをビルド
docker build -t postgres-img .

# コンテナがすでに存在しているかチェック
if docker ps -a | grep -q "postgres-con"; then
    echo "Container postgres-con already exists. Removing..."
    docker rm -f postgres-con
fi

# Dockerコンテナを起動
docker run -d \
-p 15432:5432 \
-v $PERSISTENT_VOLUME_NAME:/var/lib/postgresql/data \
--name postgres-con postgres-img

# コンテナが起動したらログイン
docker exec -it postgres-con psql -U postgres