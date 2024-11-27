class HomeController < ApplicationController
  before_action :authenticate_user! , only: [:index, :login]

  def home
  end

  def index
  end

  def login
    @user = current_user
    @accounts = current_user.accounts
    #@goals = current_user.goals
  end
end
