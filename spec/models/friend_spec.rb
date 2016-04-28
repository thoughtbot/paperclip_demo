require 'spec_helper'

RSpec.describe Friend, type: :model do
  include Paperclip::Shoulda::Matchers

  it { should validate_presence_of :name }

  it { is_expected.not_to validate_attachment_presence :avatar }
  it { is_expected.to validate_attachment_content_type(:avatar).allowing(
      'image/png', 'image/jpg', 'image/jpeg'
    ).rejecting(
      'text/plain', 'text/html'
    )
  }
  it { is_expected.to validate_attachment_size(:avatar).less_than(5.megabytes) }
end
