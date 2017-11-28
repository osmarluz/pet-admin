class Supplier < ApplicationRecord
  include Fae::BaseModelConcern

  validates :name, uniqueness: true, presence: true
  validates :phone, presence: true
  validates :email,
    uniqueness: true,
    presence: true,
    format: {
      with: Fae.validation_helpers.email_regex,
      message: 'The email format is invalid and/or this email is already taken'
    }

  def fae_display_field
    name
  end

end
