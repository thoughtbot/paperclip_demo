require 'spec_helper'

describe Friend do
  include Paperclip::Shoulda::Matchers
  it { should validate_presence_of :name }

  it { should_not validate_attachment_presence :avatar }
  it { should validate_attachment_content_type(:avatar).allowing(
      'image/png', 'image/jpg', 'image/jpeg'
    ).rejecting(
      'text/plain', 'text/html'
    )
  }
  it { should validate_attachment_size(:avatar).less_than(5.megabytes) }
end
