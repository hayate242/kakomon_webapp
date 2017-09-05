class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  class School < ActiveRecord::Base
  end

  class Content  < ActiveRecord::Base
  end
end
