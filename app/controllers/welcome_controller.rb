class WelcomeController < ApplicationController
  def index
    @wikis = policy_scope(Wiki)
  end
end
