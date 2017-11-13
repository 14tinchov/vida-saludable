class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile

  has_many :recipe_users
  has_many :recipes, through: :recipe_users
  has_many :recommendations, inverse_of: :user

  delegate :name, :first_name, :last_name, :weight, :height, :physical_activity, :physical_activity_description, :other_diseases, :other_pleasures, :format_to_physical_activity, to: :profile

  accepts_nested_attributes_for :recommendations, allow_destroy: true

  def create_profile?
    self.create_profile unless profile
  end

  def has_recipe?(recipe)
    recipes.include?(recipe)
  end

  def update_premium
    if premium
      self.update_attributes(premium: false)
    else
      self.update_attributes(premium: true)
    end
  end

  def format_to_premium
    if premium
      "Si"
    else
      "No"
    end
  end
end
