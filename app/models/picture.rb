class Picture < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
end
