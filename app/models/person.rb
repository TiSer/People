class Person < ActiveRecord::Base
  default_scope order('name ASC')

  validates_presence_of :name, :birthdate, :sex

  has_many :photos, dependent: :destroy

  attr_accessible :name, :birthdate, :sex, :marital_status, :picture
  has_attached_file :picture, :styles => { :medium => "400x400>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end
