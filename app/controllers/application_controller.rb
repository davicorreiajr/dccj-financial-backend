# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Rails::Pagination
  include Pundit
  protect_from_forgery
end
