class User < ApplicationRecord
    validates :nome, presence: true, length: { in: 3..100 }
    validates :email, presence: true, length: { maximum: 200 }, uniqueness: true
    validates :instituto, presence: true
    validates :curso, presence: true
    validates :info, presence: true, length: { maximum: 1000 }
    # validates :link_site
    # validates :link_fb
    # validates :link_tt

    has_many :follows
    has_many :orgs, through: :follows

    has_many :subscribeds
    has_many :events, :through => :subscribeds
end
