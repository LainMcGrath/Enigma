class KeyGenerator

  attr_reader :generated_key

  def initialize
    @generated_key = rand(00000..99999)
  end

  def slice_random_key
    random_key_list = []
    random_key_list << @generated_key.to_s
    split_random_keys = random_key_list[0].split("")
  end

  def random_key_sets
    key_sets = slice_random_key
    key_sets.reduce({}) do |acc, number|
      acc[:a] = ((key_sets[0] + key_sets[1]).to_i)
      acc[:b] = ((key_sets[1] + key_sets[2]).to_i)
      acc[:c] = ((key_sets[2] + key_sets[3]).to_i)
      acc[:d] = ((key_sets[3] + key_sets[4]).to_i)
      acc
    end
  end
end
