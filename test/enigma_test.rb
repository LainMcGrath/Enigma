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
    assert_instance_of String, @enigma.key_generator
    assert_instance_of String, @enigma.date
  end

  def test_it_can_create_encrypt
    placeholder = {
      :encryption => "keder ohulw",
      :key        => "02715",
      :date       => "040895"
    }
    placeholder1 = {
      :encryption => "keder ohulw!",
      :key        => "02715",
      :date       => "040895"
    }
    assert_equal placeholder, @enigma.encrypt("hello world", "02715", "040895")
    assert_equal placeholder1, @enigma.encrypt("hello world!", "02715", "040895")
  end

  def test_it_can_decrypt
    placeholder = {
      :decryption => "hello world",
      :key        => "02715",
      :date       => "040895"
    }
    placeholder2 = {
      :decryption => "hello world!",
      :key        => "02715",
      :date       => "040895"
    }
    assert_equal placeholder, @enigma.decrypt("keder ohulw", "02715", "040895")
    assert_equal placeholder2, @enigma.decrypt("keder ohulw!", "02715", "040895")
  end
end
