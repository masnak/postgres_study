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

