Given /^I have uploaded the "([^"]*)" files$/ do |file_set|
  save_and_open_page
  path= File.join(File.dirname(File.expand_path(__FILE__)), "../../test-data/#{file_set}/*")
  Dir.glob(path) do |file|
    attach_file 'files[]', file
  end
end

Then /^I should see a list with the following files:$/ do |table|
  table.rows.each do |hash|
    puts hash
  end

  # table is a | httpd/unix-directory | Photos                                           | 784677   | 766.3 kB |pending
end

When /^I should see a new button$/ do
  page.should have_selector('div#new.button')
end

When /^I should see an upload action$/ do
  page.should have_selector('form.file_upload_form')
end