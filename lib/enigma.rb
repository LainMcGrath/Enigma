class Enigma

  def initialize
  end

  def encrypt(message)
    encryption_list = {}
    encryption_list[:encryption] = message
    encryption_list[:key] = @key_generator.generated_key
    encryption_list[:date] = @offset.find_date
    encryption_list
  end
end
