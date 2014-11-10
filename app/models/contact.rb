class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, :uniqueness => {:scope => :user_id}
  validates :user_id, presence: true


  belongs_to(
    :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"
  )

  has_many(
    :contact_shares,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: "ContactShare",
    dependent: :destroy
  )

  has_many(
    :shared_users,
    through: :contact_shares,
    source: :user
  )

end