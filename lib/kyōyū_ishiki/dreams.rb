class KyōyūIshiki::Dreams
  def initialize(root)
    @root = root
  end

  def read(name)
    path = dream_path(name)

    if path.exist?
      path.read
    else
      ""
    end
  end

  def write(name, dream)
    dream_path(name).write(dream)
  end

  def delete(name)
    dream_path(name).delete
  end

  def dream_path(name)
    @root + Digest::SHA256.hexdigest(name)
  end
end