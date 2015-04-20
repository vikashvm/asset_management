class Purchase
  include Mongoid::Document

  ###########FIELDS#############
  field :product_id
  field :quantity, type: Integer
  field :purchase_date, type: Date
  field :expiry_date, type: Date
  field :cost, type: Float
  field :vendor
  field :serial_no


  ########VALIDATIONS###############
  validates :product_id, presence: true
  validates :quantity, presence: true, numericality: {greater_than: 0, only_integer: true}
  validates :purchase_date, presence: true
  validates :cost, presence: true, numericality: {greater_than: 0}
  validate :validate_serial_no

  ############RELATION##########
  belongs_to :product

  def validate_serial_no
  	errors.add(:quantity, 'cannot be more than 1 for a serial number') if serial_no and quantity != 1
  end

end
