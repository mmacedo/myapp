class Area
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :type, type: String
  belongs_to :parent, class_name: "Area", inverse_of: :divisions
  has_many :divisions, class_name: "Area", inverse_of: :parent
  has_many :elections
  attr_accessible :name, :type, :parent_id
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false, scope: :parent },
                   length: 2..30
  validates :type, presence: true

  validate do
    p = [ self ]
    until p.last.parent.nil?
      if p.include?(p.last.parent) || p.length >= 20
        errors.add :parent, errors.generate_message(:parent, :ciclic_reference)
        break
      else
        p << p.last.parent
      end
    end
  end
end
