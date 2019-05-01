module Helper::FileIO
  extend self

  def read_stdin : String
    File.read "/dev/stdin"
  end

  def write_file(path : String, data : Bytes)
    File.open(path, mode = "w", encoding = "utf-8") do |f|
      f.write data
    end
  end
end

module Helper::CLI
  extend self

  def argv_first(msg : String) : String
    if ARGV.size < 1 || ARGV[0] == ""
      puts msg
      exit 1
    end
    first = ARGV[0]
  end
end
