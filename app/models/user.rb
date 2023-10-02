class User < ApplicationRecord
  has_secure_password  # has_secure_password validation gives us access to bycrypt methods in controller based on theuser table.
  has_many :contents  
  
end
