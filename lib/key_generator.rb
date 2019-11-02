require 'Date'
class KeyGenerator

  def initialize
    @generated_key = rand(00000..99999)
  end
  
  def slice_random_key
    random_key = []
    random_key << @generated_key.to_s
    new = random_key[0].split("")
  end

  def random_key_offsets
    random = slice_random_key
    random.reduce({}) do |acc, number|
      acc[:a] = ((random[0] + random[1]).to_i)
      acc[:b] = ((random[1] + random[2]).to_i)
      acc[:c] = ((random[2] + random[3]).to_i)
      acc[:d] = ((random[3] + random[4]).to_i)
      acc
    end
  end
end
