module SvgPdf
  class PaperSize
    attr_reader :width, :height

    def initialize(width, height)
      @width = width
      @height = height
    end
  end

  class PaperSize
    A0 = PaperSize.new(841, 1189)
    A1 = PaperSize.new(594, 841)
    A2 = PaperSize.new(420, 594)
    A3 = PaperSize.new(297, 420)
    A4 = PaperSize.new(210, 297)
    A5 = PaperSize.new(148, 210)
    A6 = PaperSize.new(105, 148)
    A7 = PaperSize.new(74, 105)
    A8 = PaperSize.new(52, 74)
    A9 = PaperSize.new(37, 52)
    A10 = PaperSize.new(26, 37)

    B0 = PaperSize.new(1000, 1414)
    B1 = PaperSize.new(707, 1000)
    B2 = PaperSize.new(500, 707)
    B3 = PaperSize.new(353, 500)
    B4 = PaperSize.new(250, 353)
    B5 = PaperSize.new(176, 250)
    B6 = PaperSize.new(125, 176)
    B7 = PaperSize.new(88, 125)
    B8 = PaperSize.new(63, 88)
    B9 = PaperSize.new(44, 63)
    B10 = PaperSize.new(31, 44)
  end
end
