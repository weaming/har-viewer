require "har"
require "kilt/slang"

require "./helper"

module HARViewer
  include Helper
  extend self

  VERSION = "0.1.0"

  def read_har(file : String) : HAR::Log
    if file == "-"
      file = "/dev/stdin"
    end
    log = HAR.from_file(file)
    log
  end

  def render_entry(entries : Array(HAR::Entries)) : String
    # head = Kilt.render("src/templates/base.slang")
    head = ""
    body = Kilt.render("src/templates/entries.slang")
    head + body
  end

  def main
    log = read_har "/dev/stdin"
    if ENV["DEBUG"]?
      puts log.to_pretty_json "  "
    end

    html = render_entry log.entries
    FileIO.write_file CLI.argv_first("missing OUTPUT"), html.to_slice
  end
end

HARViewer.main
