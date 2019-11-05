class KeyGenerator

  attr_reader :generated_key

  def initialize
    @generated_key = rand(00000..99999)
  end

  def slice_random_key
    [@generated_key.to_s.rjust(5,"0")][0].split("")
  end
end
