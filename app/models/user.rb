class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile

  delegate :name, :first_name, :last_name, :weight, :height, :physical_activity, :physical_activity_description, :other_diseases, :other_pleasures, :format_to_physical_activity, to: :profile

  def create_profile?
    self.create_profile unless profile
  end
end
