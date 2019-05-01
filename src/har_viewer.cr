require "har"
require "kilt/slang"

require "./helper"

module HARViewer
  include Helper
  extend self
  VERSION = "0.1.0"

  class Renderer
    getter path : String
    getter log : (HAR::Log | Nil)

    def initialize(@path : String)
      self.read_har
    end

    def read_har
      if @path == "-"
        @path = "/dev/stdin"
      end
      @log = HAR.from_file(path)

      if ENV["DEBUG"]?
        puts @log.to_pretty_json "  "
      end
    end

    def render : String
      head = self.render_head
      # avoid compile fail
      log = @log
      if log
        body = self.render_entries log.entries
      else
        body = ""
      end
      head + body
    end

    def render_entries(entries : Array(HAR::Entries)) : String
      Kilt.render("src/templates/entries.slang")
    end

    def render_head : String
      ""
    end
  end

  def main
    renderer = Renderer.new "-"
    html = renderer.render
    FileIO.write_file CLI.argv_first("missing OUTPUT"), html.to_slice
  end
end

HARViewer.main
