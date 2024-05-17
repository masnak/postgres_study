select account, out_amount from kakeibo where out_amount > 3000;

-- 改行する方が見やすい
select account, out_amount
from kakeibo
where out_amount > 3000;
