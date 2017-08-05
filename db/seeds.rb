@user = User.create(email: "test@test.com",
                    password: "asdfasdf",
                    password_confirmation: "asdfasdf",
                    first_name: "Jon",
                    last_name: "Snow",
                    phone: "9017726822")

puts "1 User created" if @user.present?

AdminUser.create(email: "admin@test.com",
                 password: "asdfasdf",
                 password_confirmation: "asdfasdf",
                 first_name: "Admin",
                 last_name: "Taro",
                 phone: "9017726822")

puts "1 Admin User created" if AdminUser.present?


AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 6.days))
AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 12.days))
AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 20.days))

puts "3 audit logs have been created"


100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content Lorem ipsum dolor sit amet, at vidit causae latine vis, vim agam dolore periculis ne. Ne brute eirmod ius, dicant virtute eloquentiam eos id. Iudico ancillae et eam, est petentium honestatis ne, brute prompta perfecto ei has. Pro agam vocibus molestie ei. Molestie consequuntur in per, ut viderer nusquam forensibus ius. At consul fastidii sed, alterum suscipit per eu, movet congue definitiones no mea.", user_id: @user.id, overtime_request: 2.5)
end

puts "100 posts have been created"

