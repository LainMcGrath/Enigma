require './lib/key_generator'
require './lib/enigma'
require 'date'

enigma = Enigma.new
key_gen = KeyGenerator.new
handle = File.open(ARGV[0], "r")

message_to_encrypt = handle.read
handle.close

encrypted_message = enigma.encrypt(message_to_encrypt)
writer = File.open(ARGV[1], "w")
writer.write(encrypted_message[:encryption])
writer.close


puts "Created 'encrypted.txt' with the key #{key_gen.generated_key} and date #{enigma.date}."
