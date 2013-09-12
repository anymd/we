class Item < ActiveRecord::Base

  attr_accessible :title, :type

  before_validation :generate_slug
  validate :validate_uniquessness_of_slug_for_subclass
  
  scope :categories, -> { where(
    is_category: true, 
    type: self.first.class).order('position ASC') }

  has_and_belongs_to_many(:items,
    :join_table => "item_relationships",
    :foreign_key => "item_a_id",
    :association_foreign_key => "item_b_id")

  def to_param
    self.title.parameterize
  end

  def generate_slug
    self.slug ||= title.parameterize
  end

  private
  def validate_uniquessness_of_slug_for_subclass
    if self.class.find_by_slug(self.slug) && self.id == nil
      errors.add(:slug, "slug is already taken for #{self.class} subclass")
    end
  end

end
