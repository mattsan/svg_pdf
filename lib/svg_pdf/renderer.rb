require 'haml'
require 'ostruct'

module SvgPdf
  module Renderer
    MM_PER_INCH = 25.4
    POINT_PER_INCH = 72

    def self.render_svg(source, **params)
      paper_size =
        if params[:paper].is_a?(Hash) && params[:paper].size == 1
          SvgPdf::PaperSize(*params[:paper].to_a.first)
        else
          SvgPdf::PaperSize(params[:paper] || :A4)
        end

      s = source.split("\n").map {|line| "  #{line}" }.join("\n")

      ss = <<~EOS
        %svg{xmlns: 'http://www.w3.org/2000/svg', version: '1.1', width: width.mm, height: height.mm, viewBox: [0, 0, width, height].join(' ')}
        #{s}
      EOS

      SvgPdf::SVG.new(Haml::Engine.new(ss).render OpenStruct.new(paper_size.to_h.merge(params)))
    end
  end
end

class Numeric
  def mm
    self / SvgPdf::Renderer::MM_PER_INCH * SvgPdf::Renderer::POINT_PER_INCH
  end
end
