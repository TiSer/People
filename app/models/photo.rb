class Photo < ActiveRecord::Base

  belongs_to :user  

  attr_accessible :title, :priority, :picture
  has_attached_file :picture, :styles => { :medium => "400x400>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end
