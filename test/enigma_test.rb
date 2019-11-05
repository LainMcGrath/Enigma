require './test/test_helper'
require './lib/encrypted'
require './lib/decrypted'
require './lib/enigma'
require './lib/offsets'
require './lib/key_generator'

class EncryptTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_attributes
    assert_instance_of KeyGenerator, @enigma.key_generator
    assert_instance_of Offset, @enigma.offset
    assert_instance_of Encrypted, @enigma.encrypted
  end


#test doesn't pass but that is because I don't know how to use stubs
  def test_it_can_create_encrypt
    placeholder = {
      :encryption => "kbtfr",
      :key        => "98958",
      :date       => "541119"
    }
    assert_equal placeholder, @enigma.encrypt("hello")
  end

  def test_it_can_dencrypt
    placeholder = {
      :encryption => "hello!",
      :key        => "98958",
      :date       => "541119"
    }
    assert_equal placeholder, @enigma.decrypt("mabmt")
  end
end
