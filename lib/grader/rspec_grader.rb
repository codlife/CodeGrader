require 'rspec'
require 'json'
require 'tempfile'
require_relative 'auto_grader'
require_relative '../formatter/json_points_formatter'

#module Grader

#class RspecGrader < AutoGrader
  
  def initialize
  end

  def compute_grade(student_file_path,spec_file_path)
    compute_points(join_student_file_and_spec_file(student_file_path,spec_file_path)) 
  end

  def join_student_file_and_spec_file(student_file_path, spec_file_path)
    joined_files_s = IO.read(student_file_path)+"\n"+ IO.read(spec_file_path)
    Tempfile.open('spec_file') {|f| f.write joined_files_s; f}.path
  end

  def compute_points (file_path)

    errs = StringIO.new('', 'w')
    output = StringIO.new('', 'w')
    
    points_max = 0
    points = 0

    RSpec.reset
    RSpec.configure do |config|
      config.formatter = 'documentation'
      config.formatter = 'RSpec::Core::Formatters::JsonPointsFormatter'
      config.formatter = 'RSpec::Core::Formatters::BaseFormatter'
    end

    begin
      # TODO: to learning the RSpec::Core::Runner how to work
      #       and how to get the detail of rspec report
      RSpec::Core::Runner.run([file_path], errs, output)
      # Note: formatter select point message from Rspec running message
      formatter = RSpec.configuration.formatters.select {|formatter| formatter.is_a? RSpec::Core::Formatters::JsonPointsFormatter}.first
      output_hash = formatter.output_hash
      output_hash[:examples].each do |example|
        points_max += example[:points]
        points += example[:points] if example[:status] == 'passed'
    end

      
    rescue Exception => e
      puts "RSpec::Core::Runner encountered #{e.to_s}"
      puts "Errors is:\n#{output.string}"
    end

    cleaned_output = output.string.split(/\n/).select{|b| !b.match(/^    *# .*/) }.join("\n").gsub(file_path, 'your_code.rb')  # Removes large stacktraces and tmpfile from error messages.
    if e.nil?
      {raw_score: points, raw_max: points_max, comments: [cleaned_output, errs.string].join("\n")}
    else
      {raw_score: points, raw_max: 100, comments: e.to_s}
    end
     
    
    return [output_hash,points/points_max*100]
  end

#end

#end

 
#  compute_grade("./ruby_intro.rb","./part1_spec.rb")
