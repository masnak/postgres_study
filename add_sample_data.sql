/*
SQLサンプル集
*/

-- kakeiboデータベースを作成
CREATE DATABASE kakeibo;

-- kakeiboデータベースを使用
\connect kakeibo;

-- kakeiboテーブルを作成
CREATE TABLE kakeibo (
    date DATE,
    account VARCHAR(20),
    memo VARCHAR(100),
    in_amount DECIMAL(10, 2),
    out_amount DECIMAL(10, 2)
);


--　kakeiboテーブルにデータを追加

INSERT INTO kakeibo (date, account, memo, in_amount, out_amount) VALUES
('2024-02-01', '食費', 'スーパーでの買い物', 0.00, 12000.00),
('2024-02-03', '交通費', '電車通勤カードチャージ', 0.00, 10000.00),
('2024-02-05', '娯楽費', '映画鑑賞', 0.00, 1800.00),
('2024-02-07', '教育費', '書籍購入', 0.00, 3000.00),
('2024-02-10', '居住費', '電気代', 0.00, 4500.00),
('2024-02-12', '医療費', '風邪薬購入', 0.00, 800.00),
('2024-02-14', '交際費', '友人の誕生日プレゼント', 0.00, 5000.00),
('2024-02-16', '特別費', '家具購入', 0.00, 25000.00),
('2024-02-18', '食費', '外食', 0.00, 3500.00),
('2024-02-20', 'その他', '不明な出費', 0.00, 1500.00);
