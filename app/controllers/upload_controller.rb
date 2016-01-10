class UploadController < ApplicationController
  def index
       render :file => 'upload/uploadfile.rhtml'
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
   # puts(params[:type])
     post = DataFile.save(params[:upload],params[:type])
     render :text => 'upload successfully!'
  end
end

