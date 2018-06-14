class ApplicationRecord < ActiveRecord::Base
  include SnoopDogg
  
  self.abstract_class = true
end
