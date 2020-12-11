class Car < ActiveHash::Base

  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'アリ' },
    { id: 3, name: '多数アリ' },
    { id: 4, name: 'ナシ' }
  ]
  include ActiveHash::Associations
  has_many :seas

end