require_relative('curriculem_maker')

# Description
# a) This file will be used to merge the template with dynamically created data.
#

this_dir = File.dirname(__FILE__) # csv_example
site_dir = File.join(this_dir, 'site')
assets_dir = File.join(site_dir, '_assets')
target_dir = File.join(site_dir, 'programs')

# create a new CurriculumMaker
cm = CurriculumMaker.new

# add the template
# add the course data

# render output and capture in a variable
content = cm.render
puts content