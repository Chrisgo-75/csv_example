require 'erb'
require 'csv'

class CurriculumMaker

  attr_reader :course_data, # [array] of hashes.
              :template

  def initialize
    @course_data = []
    @template = 'Template missing'
  end


  # Add CSV contents
  # a) ".shift" is a method that takes the first item off an array, and destructively removes it, and
  #    passes it in to wherever we assign it.
  #
  def add_course_data(filepath)
    courses = CSV.read(filepath)
    header = courses.shift
    @course_data << { :header => header, :courses => courses }
  end


  # Add a template
  # a) Using private method "binding". So course data will be available b/c it is included in "binding".
  #
  def render
    ERB.new(@template).result(binding)
  end

end