class MainController < ApplicationController
  def select
  end
  def home
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    require 'nokogumbo'
    require 'mechanize'
    #
    # document = Nokogiri::HTML(input)
    #
    # page = Nokogiri::HTML(open("http://menu.dining.ucla.edu/Menus"))
    # # puts page.class   # => Nokogiri::HTML::Document
    #
    # document.at('title').text

    #############################


    mechanize = Mechanize.new
    page = mechanize.get('http://menu.dining.ucla.edu/Menus')

    @doc = Nokogiri::HTML(open("http://menu.dining.ucla.edu/Menus"))

    @bplate = Nokogiri::HTML(open("http://menu.dining.ucla.edu/Menus/BruinPlate"))

    @covel = Nokogiri::HTML(open("http://menu.dining.ucla.edu/Menus/Covel"))

    @deneve = Nokogiri::HTML(open("http://menu.dining.ucla.edu/Menus/DeNeve"))

    @feast = Nokogiri::HTML(open("http://menu.dining.ucla.edu/Menus/FeastAtRieber"))

    # page-wrap  container  main-content  menu-block  sect-list  sect-item  item-list  menu-item  tooltip-target-wrapper  recipelink  content


    @a = "==================="

    @b = @doc.css('h2').text

    @c = @doc.css('span').text

    @d = @doc.xpath("//span//a").text

    @bplate_menu = @bplate.xpath("//span//a").text

    @covel_menu = @covel.xpath("//span//a").text

    @deneve_menu = @deneve.xpath("//span//a").text

    @feast_menu = @feast.xpath("//span//a").text

    #######################
    @error = @bplate.xpath("//span//a").text
    ####이거 왜 안됌??? 개빡....ㄷㄷㄷㄷㄷㄷㄷㄷ

    # @e = @doc.xpath("//span//a").textxpath('//car:tire', 'car' => 'http://alicesautoparts.com/')


  end
end
