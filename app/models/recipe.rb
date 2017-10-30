class Recipe < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings

  def self.tagged_with(name)
    Tag.find_by!(name: name).recipes
  end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def self.search_by_multiple_tags(names)
    result = []
    names.split(',').map do |n|
      recipes = Tag.find_by(name: n).try(:recipes)
      result += recipes if recipes && recipes.any?
    end
    result
  end
end
