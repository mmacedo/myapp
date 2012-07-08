class Area
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :type, type: String
  belongs_to :parent, class_name: "Area", inverse_of: :divisions
  has_many :divisions, class_name: "Area", inverse_of: :parent
  attr_accessible :name, :type, :parent
  validates :name, presence: true, uniqueness: true, length: 2..30
  validates :type, presence: true
end
