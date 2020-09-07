class Status < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '新品' },
    { id: 2, name: '未使用に近い' },
    { id: 3, name: '目立った傷なし' },
    { id: 4, name: '汚れ傷あり' },
    { id: 5, name: '全体的に状態が悪い' }
  ]
end
