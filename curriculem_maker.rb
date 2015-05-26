require 'erb'
require 'csv'

class CurriculumMaker

  attr_reader :course_data, # [array]
              :template

  def initialize
    @course_data = []
    @template = 'Template missing'
  end

  # Add a template
  # a) Using private method "binding". So course data will be available b/c it is included in "binding".
  #
  def render
    ERB.new(@template).result(binding)
  end

end