# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create([
  { name: '薩爾達傳說-荒野之習', pricing: 1500, descriptions: '薩爾達傳說是任天堂所推出的奇幻電玩遊戲系列，由知名電玩遊戲設計師宮本茂製作。 遊玩的方式基本上屬於動作遊戲，但又加入了高度的解謎要素，可歸類在動作角色扮演及動作冒險類型。' },
  { name: '馬力歐賽車', pricing: 1400, descriptions: '瑪利歐賽車系列是以任天堂旗下知名遊戲 瑪利歐系列人物為背景開發的賽車遊戲，特色是可使用各式各樣的道具幫助自己與陷害對手，為瑪利歐系列本傳以外相關遊戲中銷售最好的系列。' },
  { name: '星海爭霸', pricing: 2000, descriptions: '星海爭霸是由暴雪娛樂有限公司製作發行的一系列戰爭題材科幻遊戲。遊戲系列主要由Chris Metzen與James Phinney設計開發。遊戲的劇情發生在26世紀初期的克普魯星區——位於遙遠的銀河系中心。劇情講述了三個種族之間的鬥爭，包括來自地球的人類、神秘而強大的神族以及異形蟲族。' },
])
