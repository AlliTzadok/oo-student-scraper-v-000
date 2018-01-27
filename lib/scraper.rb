require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = []
    doc = Nokogiri::HTML(open(index_url))
    doc.css(".roster-cards-container").each do |card|
      card.css(".student-card").each do |student|
        student_name = student.css(".student-name").text
        student_location = student.css(".student-location").text
        student_profile = student.css("a")[0]["href"]

        students << {:name => student_name, :location => student_location, :profile_link => student_profile}
      end
    end
    students
  end




  end

  def self.scrape_profile_page(profile_url)

  end

end
