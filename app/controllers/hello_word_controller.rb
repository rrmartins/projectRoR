class HelloWordController < ApplicationController

  def hello
    render :text => "Ola mundo!"
  end
end
