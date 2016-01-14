require_relative "../../lib/grader/rspec_grader.rb"
class UploadController < ApplicationController
  def index
       render :file => 'upload/suploadfile.rhtml'
       puts('index')
  end
  def supload
  	render :file => 'upload/suploadfile.rhtml'
  end
  def tupload
  	render :file => 'upload/tuploadfile.rhtml'
  end
  def uploadFile
   # puts("uploadfile")
   
    if params[:upload].nil?
        render :text => 'upload failed!'
    else
      post = DataFile.save(params[:upload],params[:type])
      # render :text => 'upload successfully!'
      redirect_to :action => 'viewhome'
    end
     
  end

  def viewhome
    render :file => 'upload/viewhome.rhtml'
    
  end


  def showReport
      @data=compute_grade("public/data/student/ruby_intro.rb","public/data/teacher/part1_spec.rb")
    # compute_grade("../../public/data/student/ruby_intro.rb","../../public/data/teacher/part1_spec.rb")
      puts(@data)
        render :text => @data
  end

end

