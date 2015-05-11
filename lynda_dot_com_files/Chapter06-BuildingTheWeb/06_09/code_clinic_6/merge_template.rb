#! /usr/bin/env ruby

require_relative('curriculum_maker')

# set variables for the directory paths we'll use
this_dir = File.dirname(__FILE__) # code_clinic_6
site_dir = File.join(this_dir, 'site')
assets_dir = File.join(site_dir, '_assets')
target_dir = File.join(site_dir, 'programs')

# define data and template files
semester_files = ['first_semester.csv', 'second_semester.csv']

# create a new CurriculumMaker
cm = CurriculumMaker.new

# add the template

# add the course data
semester_files.each do |semester_file|
  semester_path = File.join(assets_dir, semester_file)
  cm.add_course_data(semester_path)
end


# render output and capture in a variable
content = cm.render
puts content
