class Client < ApplicationRecord
  include Fae::BaseModelConcern

  validates :phone, presence: true
  validates :email,
    uniqueness: true,
    presence: true,
    format: {
      with: Fae.validation_helpers.email_regex,
      message: 'The email format is invalid and/or this email is already taken'
    }
  
  has_many :campaign_clients
  has_many :campaigns, through: :campaign_clients, dependent: :destroy

  def fae_display_field
    name
  end

end
