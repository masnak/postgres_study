# 使用するPostgreSQLのバージョン
ARG POSTGRES_VERSION=16

# 基本イメージとしてPostgreSQLの公式イメージを使用
FROM postgres:${POSTGRES_VERSION}

# 環境変数の設定
ENV POSTGRES_DB=test-db
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=password
ENV POSTGRES_HOST=localhost
ENV POSTGRES_PORT=15432

# ホストとのポートフォワーディングの設定
EXPOSE 15432

# PostgreSQLを前景で実行
CMD ["postgres"]


# 実行方法
# docker build -t my-postgres .
# docker run -d -p 15432:15432 --name my-postgres my-postgres
# docker exec -it my-postgres psql -U postgres


# docker start my-postgres
# docker restart my-postgres
# docker stop my-postgres

# docker rm my-postgres
# docker rmi my-postgres
# docker ps -a
# docker images
# docker logs my-postgres

# docker run -d \
#   -p 15432:15432 \
#   --name my-postgres \
#   -e POSTGRES_DB=test-db \
#   -e POSTGRES_USER=postgres \
#   -e POSTGRES_PASSWORD=password \
#   -v postgres_data:/var/lib/postgresql/data \
#   my-postgres



