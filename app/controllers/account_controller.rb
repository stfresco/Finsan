class AccountController < ApplicationController
  def index
    @accounts = Account.all
  end
end
