class Inventory
  include Mongoid::Document

  ###########FIELDS#############
  field :product_id
  field :serial_no
  field :status, default: 'Available'
  field :xid
  field :date, type: Date
  field :prod

  before_save do |doc|
    prod_obj = Product.find(product_id)
    doc.prod = "#{prod_obj.brand} #{prod_obj.equipment} #{prod_obj.model} #{prod_obj.capacity}".rstrip
  end


  ########VALIDATIONS###############
  validates :serial_no, presence: true, uniqueness: true
  validates :status, presence: true, inclusion: { in: INVENTORY_STATUSES }
  validates :product_id, presence: true
  validates :xid, presence: true, if: Proc.new {|x| x.status == 'Issued'}
  validates :date, presence: true, unless: Proc.new {|x| x.xid.nil? }
  validate :validate_employee

  def validate_employee
    errors.add(:xid, 'does not belong to a valid employee') if xid and Employee.find_by(xid: xid).nil?
  end


  ############RELATION##########
  belongs_to :product
  belongs_to :employee, foreign_key: :xid, primary_key: :xid


  ############SCOPES############
  scope :available, ->{ where(status: "Available") }
  scope :issued, ->{ where(status: "Issued") }
  scope :retired, ->{ where(status: "Retired") }

end
