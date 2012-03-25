# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
#  ensure that that e1 occurs before e2.
#  page.content  is the entire content of the page as a string.
  assert false, "Unimplmemented"
end

PAGES_TABLE_ROW_SELECTOR = " tr"

Then /I should see all of the movies/ do
   #page.should have_selector PAGES_TABLE_ROW_SELECTOR, count: pages_count
  #page.should have_selector('table tr', :count => Movie.count)
  num_movies = Movie.count
  num_rows = find("table#movies").all('tr').count
  num_movies.should == num_rows - 1 # except header
   #all("table#movies tr").count 
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
# HINT: use String#split to split up the rating_list, then
#   iterate over the ratings and reuse the "When I check..." or
#   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  all_ratings = ["G", "PG", "PG-13", "NC-17", "R" ]
  ratings_array = rating_list.gsub(/([ ])/, '') .split(',')

  if uncheck != "" then
    precheck = ""
    preuncheck = "un"
  else
    precheck = "un"
    preuncheck = ""
  end

  all_ratings.each{ |r|
    if ratings_array.include?(r) then
      step precheck+"check \"ratings_#{r}\""
    else
      step preuncheck+"check \"ratings_#{r}\""
    end
  }

end

