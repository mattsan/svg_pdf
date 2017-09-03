module SvgPdf
  def self.PaperSize(paper_size, orientation = :portrait)
    PaperSize.new(*PaperSize.const_get(orientation.capitalize)[paper_size.capitalize.to_sym])
  end

  class PaperSize
    Portrait = {
      A0: [841, 1189],
      A1: [594, 841],
      A2: [420, 594],
      A3: [297, 420],
      A4: [210, 297],
      A5: [148, 210],
      A6: [105, 148],
      A7: [74, 105],
      A8: [52, 74],
      A9: [37, 52],
      A10: [26, 37],

      B0: [1000, 1414],
      B1: [707, 1000],
      B2: [500, 707],
      B3: [353, 500],
      B4: [250, 353],
      B5: [176, 250],
      B6: [125, 176],
      B7: [88, 125],
      B8: [63, 88],
      B9: [44, 63],
      B10: [31, 44]
    }

    Landscape = {
      A0: Portrait[:A0].reverse,
      A1: Portrait[:A1].reverse,
      A2: Portrait[:A2].reverse,
      A3: Portrait[:A3].reverse,
      A4: Portrait[:A4].reverse,
      A5: Portrait[:A5].reverse,
      A6: Portrait[:A6].reverse,
      A7: Portrait[:A7].reverse,
      A8: Portrait[:A8].reverse,
      A9: Portrait[:A9].reverse,
      A10: Portrait[:A10].reverse,

      B0: Portrait[:B0].reverse,
      B1: Portrait[:B1].reverse,
      B2: Portrait[:B2].reverse,
      B3: Portrait[:B3].reverse,
      B4: Portrait[:B4].reverse,
      B5: Portrait[:B5].reverse,
      B6: Portrait[:B6].reverse,
      B7: Portrait[:B7].reverse,
      B8: Portrait[:B8].reverse,
      B9: Portrait[:B9].reverse,
      B10: Portrait[:B10].reverse
    }

    attr_reader :width, :height

    def initialize(width, height)
      @width = width
      @height = height
    end

    def to_h
      {width: @width, height: @height}
    end

    def to_a
      [@width, @height]
    end

    def to_s
      to_a.join(',')
    end

    def portrait
      self
    end

    def landscape
      PaperSize.new(@height, @width)
    end
  end
end
