require_relative "../../lib/grader/rspec_grader.rb"

class GraderController < ApplicationController
	def show_report
		@data=compute_grade("public/data/student/ruby_intro.rb","public/data/teacher/part1_spec.rb")
		# compute_grade("../../public/data/student/ruby_intro.rb","../../public/data/teacher/part1_spec.rb")
		puts("-----------------------------------------")
		render :text => "123"
	end
end
