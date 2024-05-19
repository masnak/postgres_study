/*
SQLサンプル集
*/

-- kakeiboデータベースを作成
CREATE DATABASE kakeibo;

-- kakeiboデータベースを使用
--　\connect kakeibo;

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

--　Likeの使い方
select * from kakeibo
where memo like '%スーパー%';

--　Betweenの使い方
select * from kakeibo
where date between '2024-02-01' and '2024-02-10';

-- INの使い方
select * from kakeibo
where account in ('食費', '交通費');

-- NOT INの使い方
select * from kakeibo
where account not in ('食費', '交通費');

-- ANYの使い方
select * from kakeibo
where out_amount < any (select out_amount from kakeibo where account = '食費');

/*
このSQLクエリは、kakeiboテーブルから特定の条件を満たす行を選択します。

具体的には、まずサブクエリ(select out_amount from kakeibo where account = '食費')
が実行され、accountが食費である行のout_amountの値を全て取得します。

次に、メインのクエリselect * from kakeibo where out_amount < any ( ... )が実行されます。
ここでanyは、サブクエリが返すout_amountの値のいずれか一つでもout_amountより大きいものがあれば、
その行を選択します。

つまり、このクエリは「kakeiboテーブルのout_amountが、accountが食費である行の
out_amountのいずれか一つよりも小さい全ての行を選択する」という操作を行います。
*/

SELECT * FROM kakeibo
WHERE out_amount > ANY (VALUES (5000), (55000), (6000));

SELECT * FROM kakeibo
WHERE out_amount > ANY (ARRAY[1000, 2000, 3000]);

SELECT * FROM kakeibo
WHERE out_amount > ANY (ARRAY[1000, 2000, 3000]);

