class Category < ActiveHash::Base
  self.data = [
          {id: 0, name: '--'},
          {id: 1, name: 'レディース'}, {id: 2, name: 'メンズ'}, {id: 3, name: 'ベビー・キッズ'},
          {id: 4, name: 'インテリア'}, {id: 5, name: '本'}, {id: 6, name: 'おもちゃ'},
          {id: 7, name: '家電'}, {id: 8, name: 'スポーツ'}, {id: 9, name: 'ハンドメイド'},
          {id: 10, name: 'その他'}
      ]
end
