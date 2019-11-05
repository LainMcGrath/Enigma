require 'Date'
require './lib/encrypted'
require './lib/decrypted'
require './lib/key_generator'

class Enigma
  def initialize
    @key_generator = KeyGenerator.new.slice_random_key.join("")
    @date = Time.now.strftime("%d%m%y")
  end

  def encrypt(message, key = @key_generator, date = @date)
    create_encryption = Encrypted.new(key, date)
    encryption_list = {}
    encryption_list[:encryption] = create_encryption.encrypt_message(message)
    encryption_list[:key] = key
    encryption_list[:date] = date
    encryption_list
  end

  def decrypt(message, key, date = @date)
    create_decryption = Decrypted.new(key, date)
    decryption_list = {}
    decryption_list[:decryption] = create_decryption.decrypt_message(message)
    decryption_list[:key] = key
    decryption_list[:date] = date
    decryption_list
  end
end
