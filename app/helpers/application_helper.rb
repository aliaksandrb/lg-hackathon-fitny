module ApplicationHelper
  def categories_list
    Category.all.order(name: :asc)
  end

  def previous_steps_for(step)
    guide = step.guide

    guide.steps.find_all { |s| s.line_number <= step.line_number }.
      sort_by(&:line_number)
  end
end
