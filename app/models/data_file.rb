class DataFile < ActiveRecord::Base
	def self.save(upload,type) 
		# puts(upload['datafile'].original_filename)
                         # puts(type)
    		name =  upload['datafile'].original_filename
                         if  type=='student'
                            directory="public/data/student"
                        else 
                            directory = "public/data/teacher"
                        end
    		# create the file path
    		path = File.join(directory,name)
    		puts(path)
    		# write the file
    		File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  	end
end
