require_relative "../../lib/grader/rspec_grader.rb"

class GraderController < ApplicationController
	def show
		@data,@points=compute_grade("public/data/student/ruby_intro.rb","public/data/teacher/part1_spec.rb")
		# # compute_grade("../../public/data/student/ruby_intro.rb","../../public/data/teacher/part1_spec.rb")
		# puts("-----------------------------------------")
		# render :text => "123"
	
		puts(@points)
		puts("-------------------------------")
 	 	render :file => 'grader/show.haml.rhtml'
	end
end
