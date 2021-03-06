require 'erb'
require 'csv'

class CurriculumMaker

  include ERB::Util # loads utilities which "html_escape" or "h". In essence make safe for output of HTML.
                    # "j" which makes sure that things are safe for Javascript.
                    # "u" which makes sure that things are safe to be put in the url (things can be url escaped).

  attr_reader :course_data, # [array] of hashes.
              :template

  def initialize
    @course_data = []
    @template = 'Template missing'
  end


  # Description
  # A template, in ERB terms, is a string. So we need to read in the contents of that file in order
  # to make it a template (string) that ERB can use.
  #
  def add_template(filepath)
    # templates must be strings for ERB
    @template = File.read(filepath)
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
  # a) Using private method "binding". So @course_data will be available b/c it is included in "binding".
  #
  def render
    ERB.new(@template).result(binding)
  end

end