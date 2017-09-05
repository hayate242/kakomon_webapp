class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  class School < ActiveRecord::Base
    self.table_name = "schools"
  end
end
