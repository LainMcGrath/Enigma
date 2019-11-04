require './test/test_helper'
require './lib/encrypting'
require './lib/enigma'
require './lib/offsets'
require './lib/key_generator'

class EncryptTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

#test doesn't pass but that is because I don't know how to use stubs
  def test_it_can_create_encrypt
    placeholder = {
      :encryption => "kbtfr",
      :key        => 8763,
      :date       => 041119
    }
    assert_equal placeholder, @enigma.encrypt("hello")
  end
end
