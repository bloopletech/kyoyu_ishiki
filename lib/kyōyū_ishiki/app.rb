class KyōyūIshiki::App
  def initialize(root)
    @dreams = KyōyūIshiki::Dreams.new(root)
  end

  def call(env)
    Rack::Response.new { |response| handle(Rack::Request.new(env), response) }.finish
  end

  def handle(request, response)
    dream_name = request.path_info[1..-1]

    if dream_name == ""
      response.status = 404
      return
    end

    if request.post? || request.put? || request.patch?
      @dreams.write(dream_name, request.body.read)
      request.body.rewind
    elsif request.delete?
      @dreams.delete(dream_name)
    else
      response.write(@dreams.read(dream_name))
    end
  end
end