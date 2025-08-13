User（ユーザー）
 ├─ has_many :stores
 ├─ has_many :cards
 └─ has_many :prices

Store（カードショップ実店舗）
 ├─ belongs_to :user（登録者）
 ├─ has_many :prices
 └─ has_many :cards, through: :prices

Card（カード情報）
 ├─ has_many :prices
 └─ has_many :stores, through: :prices

Price（価格情報・中間テーブル）
 ├─ belongs_to :store
 ├─ belongs_to :card
 └─ price, date, conditionなどの情報を持つ