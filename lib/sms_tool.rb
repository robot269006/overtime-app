module SmsTool
  def self.send_sms(number:, message: )
    puts "sending sms..."
    puts "#{message} to #{number}"
  end
end
