class SupportRequestsController < ApplicationController
  def index
    @support_requests = SupportRequest.all
  end
end