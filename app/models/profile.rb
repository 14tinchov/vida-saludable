class Profile < ApplicationRecord
  belongs_to :user

  enum physical_activity: [
    :a_lot,
    :normal,
    :little
  ]

  def name
    "#{first_name} #{last_name}"
  end

  def format_to_physical_activity
    case physical_activity
    when 'a_lot' then 'Mucho'
    when 'normal' then 'Normal'
    when 'little' then 'Poco'
    end
  end
end
