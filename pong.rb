require "bundler/setup"
require "hasu"

Hasu.load "ball.rb"
Hasu.load "paddle.rb"

class Pong < Hasu::Window
  HEIGHT = 800
  WIDTH = (HEIGHT * 1.61803398875).to_i

  def initialize
    super(WIDTH,HEIGHT,false)
  end

  def reset
    @ball = Ball.new

    @left_score = 0
    @right_score = 0

    @font = Gosu::Font.new(self,"Arial", 30)

    @left_paddle = Paddle.new(:left)
    @right_paddle = Paddle.new(:right)
  end

  def draw
    @ball.draw(self)

    @font.draw(@left_score,30,30,0)
    @font.draw(@right_score,WIDTH-50,30,0)

    @left_paddle.draw(self)
    @right_paddle.draw(self)
  end

  def update
    @ball.move!

    if @ball.off_left?
      @right_score += 1
      @ball = Ball.new
    end

    if @ball.off_right?
      @left_score += 1
      @ball = Ball.new
    end

    if button_down?(Gosu::KbW)
      @left_paddle.up!
    end

    if button_down?(Gosu::KbS)
      @left_paddle.down!
    end

    if button_down?(Gosu::KbUp)
      @right_paddle.up!
    end

    if button_down?(Gosu::KbDown)
      @right_paddle.down!
    end
  end
end

Pong.run
