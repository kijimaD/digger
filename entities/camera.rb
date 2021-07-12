# frozen_string_literal: true

# Field camera.
class Camera
  attr_accessor :x, :y
  attr_reader :target

  def target=(target)
    @target = target
    @x = target.x
    @y = target.y
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def viewport
    x0 = @target.x - (GameWindow::WIDTH / 2)
    x1 = @target.x + (GameWindow::WIDTH / 2)
    y0 = @target.y - (GameWindow::HEIGHT / 2)
    y1 = @target.y + (GameWindow::HEIGHT / 2)

    if x0.negative?
      x1 += -x0
      x0 = 0
    end

    if y0.negative?
      y1 += -y0
      y0 = 0
    end

    [x0, x1, y0, y1]
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
