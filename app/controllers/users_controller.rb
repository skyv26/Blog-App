class UsersController < ApplicationController
  def index
  end

  def show
    @id = request.parameters[:id]
  end
end