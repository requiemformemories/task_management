class ErrorsController < ApplicationController
  def not_found
    render status: 404
  end

  def unprocessable_entity
    render status: 422
  end

  def internal_error
    render status: 500
  end    
end
