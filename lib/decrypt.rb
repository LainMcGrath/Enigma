# require './lib/key_generator'
require './lib/enigma'
require './lib/decrypted'
require './lib/encrypt'
require 'date'

enigma = Enigma.new
key_gens = enigma.key_generator
handle = File.open("encrypted.txt", "r")
message_to_decrypt = handle.read
handle.close

decrypted_message = enigma.decrypt(message_to_decrypt, ARGV[2], ARGV[3])
writer = File.open("decrypted.txt", "w")
writer.write(decrypted_message[:decryption])
writer.close


puts "Created 'decrypted.txt' with the key #{key_gens} and date #{enigma.date}."
