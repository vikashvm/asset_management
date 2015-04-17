class Allotment
  include Mongoid::Document

  ###########FIELDS#############
  field :product_id
  field :xid
  field :date, type: Date
  field :serial_no
  field :transaction_type, default: 'Issue'


  ########VALIDATIONS###############
  validates :product_id, presence: true
  validates :xid, presence: true
  validates :transaction_type, presence: true, inclusion: {in: TRANSACTION_TYPES}

  ############RELATION##########
  belongs_to :employee, foreign_key: :xid, primary_key: :xid
  belongs_to :product
  belongs_to :inventory, foreign_key: :serial_no, primary_key: :serial_no


end
