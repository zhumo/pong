require "bundler/setup"
require "hasu"

Hasu.load "ball.rb"

class Pong < Hasu::Window
  HEIGHT = 800
  WIDTH = (HEIGHT * 1.61803398875).to_i

  def initialize
    super(WIDTH,HEIGHT,false)
  end

  def reset
    @ball = Ball.new
  end

  def draw
    @ball.draw(self)
  end
end

Pong.run
