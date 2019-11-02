class KeyGenerator

  def initialize
  end

  def generate_random_key
    5.times.map {rand(9)}.join
  end

  def slice_random_key
    r_key = generate_random_key
    random_key = []
    random_key << r_key.to_s
    new = random_key[0].split("")
  end

  def random_key_offsets
    random = slice_random_key
    random.reduce({}) do |alp, number|
      alp[:a] = ((random[0] + random[1]).to_i)
      alp[:b] = ((random[1] + random[2]).to_i)
      alp[:c] = ((random[2] + random[3]).to_i)
      alp[:d] = ((random[3] + random[4]).to_i)
      alp
    end
  end
end
