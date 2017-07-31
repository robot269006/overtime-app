namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they had overtime or not"
  task sms: :environment do
    # 1. Schedule to run every sunday at 5pm
    # 2. Iterate over all employees
    # 3. Skip admin users
    # 4. Send a message that has instructions and a link to log time

    # User.all.each do |user|
    #   SmsTool.send_sms()
    # end

    # number: "555-5555-5555"
    # number: "5555555555"
    # no spaces or dash
    # has to be 10 characters exactly
    # characters have to be a number

  end

end
