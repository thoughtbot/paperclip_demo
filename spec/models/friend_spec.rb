require 'spec_helper'

describe Friend do
  it { should validate_presence_of :name }
end