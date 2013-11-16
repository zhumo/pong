class Ball
  SIZE = 16
  attr_reader :x, :y, :angle, :speed

  def initialize
    @x = Pong::WIDTH/2
    @y = Pong::HEIGHT/2

    @angle = rand(120) + 30
    @angle *= -1 if rand > 0.5
    @speed = 6
  end

  def x1; @x - SIZE/2; end
  def x2; @x + SIZE/2; end
  def y1; @y - SIZE/2; end
  def y2; @y + SIZE/2; end

  def draw(window)
    color = Gosu::Color::RED

    window.draw_quad(
      x1, y1, color,
      x1, y2, color,
      x2, y1, color,
      x2, y2, color,
      )
  end

  def dx; Gosu.offset_x(angle,speed); end
  def dy; Gosu.offset_y(angle,speed); end

  def move!
    @x += dx
    @y += dy

    if @y < 0
      @y = 0
      bounce_off_edge!
    end
    if @x < 0
      @x = 0
      @angle = Gosu.angle(0,0,-dx,dy)
    end
    if @y > Pong::HEIGHT
      @y = Pong::HEIGHT
      bounce_off_edge!
    end
    if @x > Pong::WIDTH
      @x = Pong::WIDTH
      @angle = Gosu.angle(0,0,-dx,dy)
    end

    def bounce_off_edge!
      @angle = Gosu.angle(0,0,dx,-dy)
    end
  end

  def off_left?
    x1 < 0
  end

  def off_right?
    x2 > Pong::WIDTH
  end

end
