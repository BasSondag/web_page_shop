class User < ActiveRecord::Base
	has_secure_password

	password_format = /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x
	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
	validates :first_name, :last_name, length: { in: 2..25 }
	validates :email, format: {with: email_regex}, uniqueness: {:case_sensitive => false}
	validates :password, confirmation: true, length: {in: 8..40}
	validates :password , format: {with: password_format,
		message: "must include at least one lowercase letter, one uppercase letter, one symbol and one digit"}

end
