class Inventory
  include Mongoid::Document

  ###########FIELDS#############
  field :product_id
  field :serial_no
  field :status, default: 'Available'


  ########VALIDATIONS###############
  validates :serial_no, presence: true, uniqueness: true
  validates :status, presence: true, inclusion: { in: INVENTORY_STATUSES }
  validates :product_id, presence: true


  ############RELATION##########
  belongs_to :product
  has_many :allotments, dependent: :restrict, foreign_key: :serial_no, primary_key: :serial_no
end
