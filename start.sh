#!/bin/bash

# 永続化ボリュームの名前を定義します
PERSISTENT_VOLUME_NAME="postgres_db"

# Dockerボリュームのリストを取得します
VOLUMES=$(docker volume ls -q)

# 永続化ボリュームが存在するかどうかをチェックします
if echo "$VOLUMES" | grep -q "$PERSISTENT_VOLUME_NAME"; then
    echo "Persistent volume $PERSISTENT_VOLUME_NAME exists."
else
    echo "Persistent volume $PERSISTENT_VOLUME_NAME does not exist. Creating..."
    docker volume create $PERSISTENT_VOLUME_NAME
fi

# Dockerコンテナをビルド
docker build -t postgres-img .

# Dockerコンテナを起動します
docker run -d \
-p 15432:5432 \
-v $PERSISTENT_VOLUME_NAME:/var/lib/postgresql/data \
--name postgres-con postgres-img

# コンテナが起動したらログインします
docker exec -it postgres-con psql -U postgres