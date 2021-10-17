class Room < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '百合' },
    { id: 3, name: '蘭' },
    { id: 4, name: '薔薇' },
    { id: 5, name: '秋桜' },
    { id: 6, name: '桜' },
    { id: 7, name: '山茶花' },
    { id: 8, name: '藤' },
    { id: 10, name: '楓' }
  ]

  include ActiveHash::Associations
  has_many :reservations

end