require "gosu"
class Game < Gosu::Window
	def initialize
		super(640, 480, false)
		self.caption = "Game"
		@font = Gosu::Font.new(18)
		@input = []
    @scene = ""
    @elements = []
    go_to_scene("intro")
		# @input = InputManager.new([Gosu::KbUp, Gosu::KbDown, Gosu::KbLeft, Gosu::KbRight, Gosu::KbSpace, Gosu::MsLeft], lambda{|i| button_down?(i)})
	end
	def update
		if @input.include?(Gosu::KbEscape)
			self.close!
		end
    method("scene_#{@scene}_update".to_sym).call
		@input = []
	end
	def draw
    method("scene_#{@scene}_draw".to_sym).call
	end
  def go_to_scene(name)
    @scene = name
    method("scene_#{@scene}_init".to_sym).call
  end

  #Intro scene
  def scene_intro_init
    @elements = [
      {
        x: 320,
        y: 160,
        sprite: Gosu::Image.new("Sprites/Carre.png")
      },
      {
        x: 320,
        y: 320,
        sprite: Gosu::Image.new("Sprites/Carre.png")
      }
    ]
  end
  def scene_intro_update
    if button_down?(Gosu::KbUp)
      @elements[0][:y] -= 2
    end
    if button_down?(Gosu::KbDown)
      @elements[0][:y] += 2
    end
    if button_down?(Gosu::KbLeft)
      @elements[0][:x] -= 2
    end
    if button_down?(Gosu::KbRight)
      @elements[0][:x] += 2
    end
  end
  def scene_intro_draw
    @elements.each{|i| i[:sprite].draw(i[:x], i[:y], 0)}
  end

  def button_down(id)
		@input << id
	end
  def pressed?(id)
    @input.include?(id)
  end
end

game = Game.new
game.show
