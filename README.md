# 使用說明

1. 建立商品資料請使用 `rake db:seed`，目前沒有新增商品頁面。
2. Admin 需要在使用者註冊後，手動進 DB 修改 role 為 `100`。

# 規格

- 每個使用者只會有一個購物車，先以 session 儲存。

## DB Schema

### users

| Column     | Type    | Description |
| ---------- | ------- | ----------- |
| id         | integer |             |
| name       | string  |             |
| role       | integer |             |
| auth_token | string  |             |

### receivers

| Column  | Type    | Description |
| ------- | ------- | ----------- |
| id      | integer |             |
| user_id | integer |             |
| name    | string  |             |
| phone   | string  |             |
| address | string  |             |

### orders

| Column      | Type     | Description                            |
| ----------- | -------- | -------------------------------------- |
| id          | integer  |                                        |
| receiver_id | integer  |                                        |
| payment     | tiny_int | 1: 信用卡, 2: ATM 匯款                      |
| status      | tiny_int | 1: 未付款, 2: 已付款, 3: 已出貨, 4: 已完成, 0: 已取消 |


### order_products

| Column     | Type    | Description |
| ---------- | ------- | ----------- |
| id         | integer |             |
| order_id   | integer |             |
| product_id | integer |             |
| pricing    | decimal |             |
| amount     | integer |             |


### products

| Column       | Type    | Description |
| ------------ | ------- | ----------- |
| id           | integer |             |
| name         | string  |             |
| pricing      | decimal |             |
| descriptions | text    |             |

