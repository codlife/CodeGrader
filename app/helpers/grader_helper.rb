require_relative "../../lib/grader/rspec_grader.rb"
 
module GraderHelper
	def GraderHelper.grader
	            return compute_grade("public/data/student/ruby_intro.rb","public/data/teacher/part1_spec.rb")
	end
end

