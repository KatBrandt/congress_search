require 'rails_helper'

describe CongressService do
  context 'class methods' do
    context '#members_of_house by state' do
      it 'returns member data' do
        search = CongressService.members_of_house("CO")

        #want to test the shape of the data to catch any changes in the API we're hitting - don't want to test specific values since those can change and we have no control over them, but we are counting on this data coming back in a specific shape and we want to catch if that changes

        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array

        member_data = search[:results].first
        expect(member_data).to have_key :name
        expect(member_data[:name]).to be_a String

        expect(member_data).to have_key :role
        expect(member_data[:role]).to be_a String

        expect(member_data).to have_key :district
        expect(member_data[:district]).to be_a String

        expect(member_data).to have_key :party
        expect(member_data[:party]).to be_a String
      end
    end
  end
end
