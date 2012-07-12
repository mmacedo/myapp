class Election
  include Mongoid::Document
  include Mongoid::Timestamps
  field :election_start, type: Date
  field :election_end, type: Date
  field :post, type: String
  belongs_to :area
  attr_accessible :_id, :area_id, :election_start, :election_end, :post
  validates :area, presence: true
  validates :post, presence: true, length: 2..30
  validates :election_end, presence: true

  validate do
    if election_end? && election_start? && election_start > election_end
      errors.add :election_start,
                 errors.generate_message(:election_start, :inverted_range)
    end
  end
end
