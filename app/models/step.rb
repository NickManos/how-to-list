class Step < ActiveRecord::Base
  belongs_to :list, :foreign_key => 'list_id'
end
