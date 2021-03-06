require 'open-uri'
require 'json'

class ApiController < ApplicationController
  def pirate_form
  end

  def pirate_process
    #=== Instructions ===================================
    # Translate the text submitted from the pirate_form action
    # into pirate-speak
    #
    # Ref: http://isithackday.com/arrpi.php?
    #================================================
    @result = "Replace this string with your answer"
  end


  def coord_form
    #=== Instructions ===================================
    # Create a form to send a user's address to the coord_process
    # action
    #================================================
  end

  def coord_process
    #=== Instructions ===================================
    # Using the Google geocoding API, find latitude and longitude
    # coordinates based on a user-submitted address. Send the
    # coordinates down to the view.
    #
    # Ref: https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA
    # as an example
    #================================================
    @coords = "An array with your coordinates inside"
  end

  def meme_gen_form
    #=== Instructions ===================================
    # Create a form to send a info to the meme_gen_process
    # action
    #
    # Ref: http://apimeme.com/
    #================================================
  end

  def meme_process_form
    #=== Instructions ===================================
    # Create a meme based on user-submitted info
    #
    # Ref: http://apimeme.com/
    #================================================
  end

  def congress_form
    #=== Instructions ===================================
    # Create a form to send a keyword to the congress_process
    # action
    #================================================
  end

  def congress_process
    #=== Instructions ===================================
    # Use the Library of Congress image API to display a relevant
    # picture based on a user-submitted keyword
    #
    # Ref: http://www.loc.gov/pictures/search/?q=computer&fo=json
    #================================================

 address = URI.encode(params["text"])
    url = "http://www.loc.gov/pictures/search/?q=#{address}&fo=json"
    initial_info = open(url).read
    parsed_info = JSON.parse(initial_info)
    @result = parsed_info["results"][1]["image"]["full"]





  end

  def random_process
    #=== Instructions ===================================
    # Use the Radom User API to create a dynamic profile page
    # that changes on page refresh. Use at least 3 items from
    # the API response
    #
    # Ref: http://api.randomuser.me/
    #================================================

      url = "http://api.randomuser.me/"
      initial_info = open(url).read
      parsed_info = JSON.parse(initial_info)

      @name = parsed_info["results"][0]["user"]["name"]["first"]
      @user_name = parsed_info["results"][0]["user"]["username"]
      @picture = parsed_info["results"][0]["user"]["picture"]["large"]

  end

  def wiki_form
    #=== Instructions ===================================
    # Create a form to send a keyword to the wiki_image_process
    # action
    #================================================
  end

  def wiki_process
    #=== Instructions ===================================
    # Use the Wikipedia API to display a relevant
    # picture or set of pictures based on a user-submitted keyword
    #
    # Ref: http://techslides.com/grab-wikipedia-pictures-by-api-with-php
    #================================================
change = params["text"].gsub(/\s+/ , "_")

address = URI.encode(change)
    url = "http://en.wikipedia.org/w/api.php?action=query&titles=File:#{address}.jpg&prop=imageinfo&iiprop=url&format=json"

    initial_info = open(url).read
    parsed_info = JSON.parse(initial_info)
    @result = parsed_info["query"]["pages"]["-1"]["imageinfo"][0]["url"]
  end

  def nearest_station
    #=== Instructions ===================================
    # Use the Divvy API to display all stations that have at least
    # 5 bikes available
    #
    # Bonus: Sort the stations by distance from a user-submitted
    # address
    #
    # Ref: http://www.divvybikes.com/stations/json/
    #================================================

        #how to raise someing [     raise    varable.inspect       ]

   all_stations = []


    url = "http://www.divvybikes.com/stations/json/"
    initial_info = open(url).read
    parsed_info = JSON.parse(initial_info)


      stations = parsed_info["stationBeanList"]




      stations.each do |stations|
           if  stations["availableBikes"] > 5
          all_stations.push(stations["stationname" ] )
        end

      end


@result = all_stations

   # Just displaying info from one station
   #@result = parsed_info["stationBeanList"][0]["availableBikes"]




  end
end
