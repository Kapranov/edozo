class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :tasks, inverse_of: :project, dependent: :destroy

  accepts_nested_attributes_for :tasks,
    reject_if: proc { |attributes| attributes[:name].blank? },
    allow_destroy: true

  def self.search(term, page)
    if term
      where('name LIKE ?', "%#{term}%").paginate(page: page, per_page: 5).order('id DESC')
    else
      paginate(page: page, per_page: 1).order('id DESC')
    end
  end

  validates :name, presence: true
end
