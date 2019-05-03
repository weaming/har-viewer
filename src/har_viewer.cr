require "uri"
require "har"
require "kilt/slang"
require "kemal"

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
        body = self.render_log log
      else
        body = ""
      end
      head + body
    end

    def render_log(log : HAR::Log) : String
      Kilt.render("src/templates/log.slang")
    end

    def render_head : String
      title = @path
      Kilt.render("src/templates/head.slang")
    end
  end

  def main
    out_or_cmd = CLI.argv_first("missing OUTPUT or COMMAND. COMMAND choices are [serve, ].")
    if out_or_cmd == "serve"
      port = CLI.argv_n(2, "missing port")
      serve_http port.to_i32
    else
      renderer = Renderer.new "-"
      html = renderer.render
      FileIO.write_file out_or_cmd, html.to_slice
    end
  end

  def serve_http(port : Int32?)
    error 404 do
      "404 NOT FOUND"
    end

    get "/*" do |env|
      path = env.request.path[1..]
      if path == ""
        path = "."
      end

      if File.file?(path) && path.ends_with?(".har")
        renderer = Renderer.new path
        html = renderer.render
        html
      elsif File.directory?(path)
        if path.ends_with?('/') || path == "."
          dir = Dir.open path
          title = path
          head = Kilt.render("src/templates/head.slang")
          body = Kilt.render("src/templates/dir.slang")
          head + body
        else
          env.redirect "#{path}"
        end
      else
        puts "#{path} not found"
        env.response.status_code = 404
      end
    end

    Kemal.run port
  end
end

HARViewer.main
