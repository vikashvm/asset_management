class Product
  include Mongoid::Document

  ###########FIELDS#############
  field :brand
  field :equipment
  field :model
  field :capacity


  ########VALIDATIONS###############
  validates :brand, presence: true, inclusion: { in: XEBIA_BRANDS }
  validates :equipment, presence: true, inclusion: { in: XEBIA_EQUIPMENTS }
  validates :model, presence: true, uniqueness: true

  ############RELATION##########
  has_many :inventories, dependent: :restrict
  has_many :allotments, dependent: :restrict
  has_many :purchases, dependent: :restrict
end
