class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # RELATIONS
  has_many :responses
  has_many :bank_accounts

  # VALISATIONS
  validates :email, presence: true


  # METHODS
  def full_name
    [first_name, last_name].join(' ')
  end

  def to_s
    full_name
  end

end
