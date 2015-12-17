class WelcomeController < ApplicationController
  def index
    @wikis = policy_scope(Wiki)
  end

  # def user
  # end
end
