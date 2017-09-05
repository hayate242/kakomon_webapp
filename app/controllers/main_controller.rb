class MainController < ApplicationController
  def index

    # @file = File.new
  end

  def each_page
    @school = School.where(id: 1).where(id: 1)
    p @school
  end

end
