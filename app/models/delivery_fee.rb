class DeliveryFee < ActiveHash::Base
  self.data = [
          {id: 0, name: '--'},
          {id: 1, name: '着払い'}, 
          {id: 2, name: '送料込み'},
      ]
end