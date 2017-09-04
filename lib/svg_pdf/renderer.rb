require 'haml'
require 'ostruct'

module SvgPdf
  class Renderer
    MM_PER_INCH = 25.4
    POINT_PER_INCH = 72

    attr_accessor :template

    def initialize(template)
      @template = template
    end

    def render(**params)
      paper_size =
        if params[:paper].is_a?(Hash) && params[:paper].size == 1
          SvgPdf::PaperSize(*params[:paper].to_a.first)
        else
          SvgPdf::PaperSize(params[:paper] || :A4)
        end

      entity_haml = @template.split("\n").map {|line| "  #{line}" }.join("\n")

      svg_haml = <<~EOS
        %svg{xmlns: 'http://www.w3.org/2000/svg', version: '1.1', width: width.mm, height: height.mm, viewBox: [0, 0, width, height].join(' ')}
        #{entity_haml}
      EOS

      SvgPdf::SVG.new(Haml::Engine.new(svg_haml).render OpenStruct.new(paper_size.to_h.merge(params)))
    end
  end
end

class Numeric
  def mm
    self / SvgPdf::Renderer::MM_PER_INCH * SvgPdf::Renderer::POINT_PER_INCH
  end
end
