require 'rsvg2'
require 'stringio'

module SvgPdf
  class SVG
    def initialize(svg_string)
      @svg_string = svg_string
    end

    def to_s
      @svg_string
    end

    def as_svg
      @svg_string
    end

    def as_pdf
      sio = StringIO.new
      render_pdf(sio)
      sio.string
    end

    def save_as_svg(filename)
      File.open(filename, 'w') do |file|
        file.write @svg_string
      end
    end

    def save_as_pdf(filename)
      File.open(filename, 'w') do |file|
        render_pdf(file)
      end
    end

    private

    def render_pdf(sink)
      svg = RSVG::Handle.new_from_data(@svg_string)
      dim = svg.dimensions
      surface = Cairo::PDFSurface.new(sink, dim.width, dim.height)
      cairo = Cairo::Context.new(surface)
      cairo.render_rsvg_handle(svg)
      surface.finish

      {
        height: dim.height,
        width: dim.width
      }
    end
  end
end
