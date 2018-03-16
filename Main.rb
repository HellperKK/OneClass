require "gosu"
class Game < Gosu::Window
	def initialize
		super(640, 480, false)
		self.caption = "Game"
		@font = Gosu::Font.new(18)
		@input = []
    @scene = ""
    go_to_scene("intro")
		# @input = InputManager.new([Gosu::KbUp, Gosu::KbDown, Gosu::KbLeft, Gosu::KbRight, Gosu::KbSpace, Gosu::MsLeft], lambda{|i| button_down?(i)})
	end
	def update
		if @input.include?(Gosu::KbEscape)
			self.close!
		end
    method("scene_#{@scene}_update".to_s).call
		@input = []
	end
	def draw
    method("scene_#{@scene}_draw".to_s).call
	end
  def go_to_scene(name)
    @scene = name
    method("scene_#{@scene}_init".to_s).call
  end

  #Intro scene
  def scene_intro_init

  end
  def scene_intro_update

  end
  def scene_intro_draw

  end

  def button_down(id)
		@input << id
	end
  def pressed?(id)
    @input.include?(id)
  end
  def pressing?(id)
    button_down?(id)
  end
end

game = Game.new
game.show
