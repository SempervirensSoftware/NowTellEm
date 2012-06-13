class UnsubscribesController < ApplicationController
  def show
    @unsubscribe = Unsubscribe.find_by_token(params[:token])
    @unsubscribe.unsubscribed = true
    @unsubscribe.save
  end
  def resubscribe
    @resubscribe = Unsubscribe.find_by_token(params[:token])
    @resubscribe.unsubscribed = false
    @resubscribe.save
  end
end
