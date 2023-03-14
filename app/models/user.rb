class User < ApplicationRecord

    # encrypt the password_digest field using bcrypt
    has_secure_password

    # Validate presence and uniqueness of email
    validates_presence_of :email
    validates_uniqueness_of :email
end
