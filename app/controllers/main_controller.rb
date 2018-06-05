class MainController < ApplicationController
  helper_method :current_user

  def create
    @swipe = Swipe.new
    @swipe.dininghall = params[:dininghall]

    @swipe.save
    redirect_to "/main/buyerinput/#{@swipe.id}"
  end

  def swipelist
    @dininghall = Sell.find(params[:dininghall])
  end

  def sell
    @dininghall = Sell.new
    @dininghall.dininghall = params[:dininghall]

    @dininghall.save
    redirect_to "/main/buyerlist/#{@dininghall.dininghall}"


    # @swipe = Swipe.find(params[:dininghall])
  end

  def buyerlist

    @swipe = Swipe.all

    @swipe3 = Swipe.find_by dininghall: "#{params[:dininghall]}"

    @swipe2 = Swipe.where(dininghall: "#{params[:dininghall]}").take


    @dininghall = "#{params[:dininghall]}"
  end

  def cancel
    @swipe = Swipe.find(params[:swipe_id])
    @swipe.destroy

    redirect_to "/main/dininghall"
  end

  def buyerinput
    @swipe = Swipe.find(params[:swipe_id])
  end

  def input
    #@current_user ||= User.find(session[:user_id]) if session[:user_id]
    # @uid = current_user.uid

    @swipe = Swipe.find(params[:swipe_id])
    @swipe.swipes = params[:people]
    @swipe.price = params[:price]
    # @swipe.uid = @uid
    @swipe.save
    redirect_to "/main/wait"
  end

  def dininghall
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    require 'nokogumbo'
    require 'mechanize'
    mechanize = Mechanize.new
    page = mechanize.get('http://menu.dining.ucla.edu/Menus')
    @doc = Nokogiri::HTML(open("http://menu.dining.ucla.edu/Menus"))
    @bplate = Nokogiri::HTML(open("http://menu.dining.ucla.edu/Menus/BruinPlate"))
    @covel = Nokogiri::HTML(open("http://menu.dining.ucla.edu/Menus/Covel"))
    @deneve = Nokogiri::HTML(open("http://menu.dining.ucla.edu/Menus/DeNeve"))
    @feast = Nokogiri::HTML(open("http://menu.dining.ucla.edu/Menus/FeastAtRieber"))
    @a = "==================="
    @b = @doc.css('h2').text
    @c = @bplate.css('span').text
    @d = @bplate.xpath("//span//a").text

    @bplate_date = @bplate.css('h2').text
    @covel_date = @covel.css('h2').text
    @deneve_date = @deneve.css('h2').text
    @feast_date = @feast.css('h2').text

    # @bplate_menu = @bplate.xpath("//span//a").text
    # @covel_menu = @covel.xpath("//span//a").text
    # @deneve_menu = @deneve.xpath("//span//a").text
    # @feast_menu = @feast.xpath("//span//a").text
    ### no spaces between different items..
    @bplate_menu = @bplate.css('span').text
    @covel_menu = @covel.css('span').text
    @deneve_menu = @deneve.css('span').text
    @feast_menu = @feast.css('span').text

    @error = @bplate.xpath("//span//a").text
    ######################################
    #sending dininghall data to db

  end

  def home
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    require 'nokogumbo'
    require 'mechanize'
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
    @c = @bplate.css('span').text
    @d = @bplate.xpath("//span//a").text

    @bplate_menu = @bplate.xpath("//span//a").text
    @covel_menu = @covel.xpath("//span//a").text
    @deneve_menu = @deneve.xpath("//span//a").text
    @feast_menu = @feast.xpath("//span//a").text
    #######################
    @error = @bplate.xpath("//span//a").text
  end
end
