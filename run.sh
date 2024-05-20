# 永続化ボリュームの名前を定義します
PERSISTENT_VOLUME_NAME="postgres_db"

# Dockerコンテナを起動します
docker run -d \
-p 15432:5432 \
-v $PERSISTENT_VOLUME_NAME:/var/lib/postgresql/data \
--name postgres-con postgres-img

# コンテナが起動したらログインします
docker exec -it postgres-con psql -U postgres