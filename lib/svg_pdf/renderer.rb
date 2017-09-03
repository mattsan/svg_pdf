require 'haml'
require 'rsvg2'
require 'ostruct'

module SvgPdf
  module Renderer
    MM_PER_INCH = 25.4
    POINT_PER_INCH = 72

    def self.render_svg(source, **params)
      paper_size = params[:paper] || SvgPdf::PaperSize::A4

      s = source.split("\n").map {|line| "  #{line}" }.join("\n")

      ss = <<~EOS
        %svg{xmlns: 'http://www.w3.org/2000/svg', version: '1.1', width: width.mm, height: height.mm, viewBox: [0, 0, width, height].join(' ')}
        #{s}
      EOS

      Haml::Engine.new(ss).render OpenStruct.new(paper_size.to_h.merge(params))
    end

    def self.save_as_pdf(source, filename, **params)
      svg = RSVG::Handle.new_from_data(render_svg(source, params))
      dim = svg.dimensions
      surface = Cairo::PDFSurface.new(File.open(filename, 'w'), dim.width, dim.height)

      cairo = Cairo::Context.new(surface)
      cairo.render_rsvg_handle(svg)

      {
        height: dim.height,
        width: dim.width
      }
    end
  end
end

class Numeric
  def mm
    self / SvgPdf::Renderer::MM_PER_INCH * SvgPdf::Renderer::POINT_PER_INCH
  end
end
