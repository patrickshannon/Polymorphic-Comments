class Comment < ActiveRecord::Base
  has_ancestry

  belongs_to :commentable, :polymorphic => true  

  validates :body, :presence => TRUE  
  
end
