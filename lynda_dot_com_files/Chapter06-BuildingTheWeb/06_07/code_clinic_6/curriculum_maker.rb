require 'erb'
require 'csv'

class CurriculumMaker
  
  attr_reader :course_data, :template

  def initialize
    @course_data = []
    @template = 'Template missing'
  end
  
  def render
    ERB.new(@template).result(binding)
  end
  
end
