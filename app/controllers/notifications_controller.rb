class NotificationsController < ApplicationController
  def index
    Pusher.trigger('test_channel', 'my_event', {
      message: 'hello world Teena'
    })
  end

  def create
  	
  end
end