class Saler < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :name, :email, :password, :description, :image

  mount_uploader :image, AvatarUploader

  include Gravtastic
  gravtastic

  def self.ordered_by_name
    self.order(:name)
  end
end
