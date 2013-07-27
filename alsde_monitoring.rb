require 'open-uri'

class ALSDEMonitoring
  def initialize(path)
    @path = path
  end

  def call
    open(url) do |f|
      File.open(filename, 'w') do |output|
        output << f.read
      end
    end

    STDOUT.puts "Yurp, got 'em"
  end

  private
  def url
    "http://www.alsde.edu/home/Executive/BoardMeetingInfo.aspx"
  end

  def filename
    File.join(@path, "#{today}_alsde_agenda.html")
  end

  def today
    Time.now.strftime("%Y-%m-%d")
  end
end

if __FILE__ == $0
  ALSDEMonitoring.new(ARGV[0]).call
end
