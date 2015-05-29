require_relative('curriculem_maker')

# Description
# a) This file will be used to merge the template with dynamically created data.
#

this_dir = File.dirname(__FILE__) # csv_example
site_dir = File.join(this_dir, 'site')
assets_dir = File.join(site_dir, '_assets')
target_dir = File.join(site_dir, 'programs')

# define data and template files
semester_files = ['first_semester.csv', 'second_semester.csv']
template_file  = 'graphic-design.html.erb'
target_file    = 'graphic_design.htm'

# create a new CurriculumMaker
cm = CurriculumMaker.new

# add the template
template_path = File.join(assets_dir, template_file)
cm.add_template(template_path)

# add the course data
semester_files.each do |semester_file|
  semester_path = File.join(assets_dir, semester_file)
  cm.add_course_data(semester_path)
end

# render output and capture in a variable
content = cm.render
# puts content

# Save a file in Ruby
output_path = File.join(target_dir, target_file)
# a) take string and use File.open
# b) "w+" 1) creates the file if it doesn't exist, 2) if file does exist will truncate the contents of the file so
#         that the file will be empt and then open the file up to be written and read to.
File.open(output_path, 'w+') do |f|
  f.write(content)
end