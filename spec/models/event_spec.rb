require 'rails_helper'

describe Event, type: :model do
  it { validate_uniqueness_of(:name) }
end
