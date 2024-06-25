#!/bin/bash

# 永続化ボリュームの名前を定義
PERSISTENT_VOLUME_NAME="postgres_db"

# コンテナ名を変数に格納
CONTAINER_NAME="postgres-con"

# コンテナにログイン
docker exec -it $CONTAINER_NAME bash