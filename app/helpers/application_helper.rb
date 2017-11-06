module ApplicationHelper
  def tag_cloud(tags, classes)
    max = tags.sort_by(&:count).last
    tags.each do |tag|
      index = tag.count.to_f / max.count * (classes.size - 1)
      yield(tag, classes[index.round])
    end
  end

  def build_body_class
    if current_page?(root_path)
      'home'
    else
      'not-transparent-header'
    end
  end

  def build_physical_activity_options
    label_physical_activities = ['Mucho', 'Normal', 'Poco']

    physical_activities = Profile.physical_activities.keys
    physical_activities.each_with_index.inject([]){ |rtn, pair|
      element, index = pair
      rtn << [label_physical_activities[index], element]
    }
  end
end
