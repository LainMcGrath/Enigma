require './lib/key_generator'
require './lib/enigma'
require 'date'

enigma = Enigma.new
key_gen = KeyGenerator.new
handle = File.open(ARGV[0], "r")

message_to_encrypt = handle.read
handle.close

encrypted_message = enigma.encrypt(message_to_encrypt)

# write_message(ARGV[1], encryption[:encryption])

puts "Created 'encrypted.txt' with the key #{key_gen.generated_key} and date #{enigma.date}."
