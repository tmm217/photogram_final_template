# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer          default("0")
#  image          :string
#  likes_count    :integer          default("0")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#
class Photo < ApplicationRecord
  validates(:poster, { :presence => true })
  validates(:image, { :presence => true })
  
  # def poster
  #   return User.where({ :id => self.owner_id }).at(0)
  # end

  # def comments
  #   return Comment.where({ :photo_id => self.id })
  # end

  # def likes
  #   return Like.where({ :photo_id => self.id })
  # end

  # def fans
  #   array_of_user_ids = self.likes.pluck(:fan_id)

  #   return User.where({ :id => array_of_user_ids })
  # end

  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  belongs_to :poster, :class_name => "User", :foreign_key => "owner_id"
  has_many :commenters, :through => :comments, :source => :author
  has_many :fans, :through => :likes, :source => :fan
  has_many :viewers, :through => :owner, :source => :leaders
  has_many :discovering, :through => :fans, :source => :leaders

  def fan_list
    return fans.pluck(:username).to_sentence
  end
end
