class KyōyūIshiki::CLI
  def initialize(argv)
    @argv = argv
    @root = Pathname.new(argv.first || ".").realpath
  end

  def start
    Rack::Handler::Puma.run(KyōyūIshiki::App.new(@root), { Port: 9001 })
  end
end