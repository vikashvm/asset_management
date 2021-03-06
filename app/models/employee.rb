class Employee
  include Mongoid::Document


  #############FIELDS#############
  field :name
  field :xid
  field :email
  field :phone, type: Integer

  ###VALIDATIONS####
  validates :name, presence: true
  validates :xid, presence: true, uniqueness: true, format: {with: /\AXI\d+\z/}
  validates :email, presence: true, uniqueness: true, format: {with: /\A([\w-]+(?:\.[\w-]+)*)@xebia.com\z/}
  validates :phone, presence: true, uniqueness: true, numericality: {only_integer: true}, format: {with: /\A\d{10}\z/}

  ######RELATIONS###########
  has_many :inventories, dependent: :restrict, foreign_key: :xid, primary_key: :xid
end
