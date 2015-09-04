class Test < ActiveRecord::Base
  belongs_to :rule
  belongs_to :ticket
end
