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
    key_sets = {}
    key_sets[:a] = ((slice_random_key[0] + slice_random_key[1]).to_i)
    key_sets[:b] = ((slice_random_key[1] + slice_random_key[2]).to_i)
    key_sets[:c] = ((slice_random_key[2] + slice_random_key[3]).to_i)
    key_sets[:d] = ((slice_random_key[3] + slice_random_key[4]).to_i)
  end
end
