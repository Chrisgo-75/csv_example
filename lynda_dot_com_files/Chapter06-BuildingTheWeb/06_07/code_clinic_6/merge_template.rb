#! /usr/bin/env ruby

require_relative('curriculum_maker')

# set variables for the directory paths we'll use
this_dir = File.dirname(__FILE__) # code_clinic_6
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
