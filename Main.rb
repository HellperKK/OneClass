require "gosu"
class Game < Gosu::Window
	def initialize
		super(640, 480, false)
		self.caption = "Game"
		@font = Gosu::Font.new(18)
		@input = []
		# @input = InputManager.new([Gosu::KbUp, Gosu::KbDown, Gosu::KbLeft, Gosu::KbRight, Gosu::KbSpace, Gosu::MsLeft], lambda{|i| button_down?(i)})
	end
	def update
		if @input.include?(Gosu::KbEscape)
			self.close!
		end
		@input = []
	end
	def draw
    
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
