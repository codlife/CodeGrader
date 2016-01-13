 Given(/^?:|Student) write code stored in the local$/) do
end

When(/^Student chose "(.*?)"$/) do |arg1|
   
end

When(/^Student click "(.*?)" button$/) do |arg1|
end

Then(/^The uplode button in Student's view should changed as "(.*?)" ,and the code should be stored into file server,return uplode success$/) do |arg1|
   # uplode file
   #
   if (!File.exist?("/public/data"+arg1))
	{raise "Student filefolder not exist"}
   if (!File.exist?("/public/data"+arg1))
	{raise "Student code not exist"}

end

Given(/^Students have successfully submitted a written task code "(.*?)"$/) do |arg1|
   if (!File.exist?("/public/data"+arg1))
	{raise "Student code not exist"}
end

Given(/^The teacher has successfully submitted the corresponding test code "(.*?)" for "(.*?)"$/) do |arg1, arg2|
	if (!File.exist?("/public/data/student"+arg2))
	{raise "test code not exist"}
	if (!File.exist?("/public/data/teacher"+arg1))
	{raise "Student code not exist"}

end

When(/^Student Click to view the "(.*?)" Report$/) do |arg1|
   # 调用代码运行程序
end

Then(/^Generate "(.*?)" test report$/) do |arg1|
   if (!File.exist?("/public/data/report"+arg1))
	{raise "Student report not exist"}
end

Given(/^There has generated the test report for "(.*?)"$/) do |arg1|
  if (!File.exist?("/public/data/report"+arg1))
	{raise "Student report not exist"}
end

When(/^I Click the button of checking report about "(.*?)"$/) do |arg1|
end

Then(/^View the report of "(.*?)"$/) do |arg1|
   aFile = File.new("/public/data/report"+arg1, "r")
	if aFile
   content = aFile.sysread(20)
   puts content
	else
   puts "Unable to open file!"
end
end

Given(/^Teacher written homework "(.*?)" test code$/) do |arg1|
end

When(/^The teacher choose the test file "(.*?)""(.*?)"HW(\d+)"$/) do |arg1, arg2, arg3|

end

When(/^Teacher click Submit button$/) do
end

Then(/^return success uplpde, and code be store in file server$/) do
 if (!File.exist?("/public/data/teacher/"+arg1))
	{raise "teacher test file not uplode"}
end

