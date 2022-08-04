class CongressFacade
  def self.members(state = "CO")
    data = CongressService.members_of_house(state)
    @members = data[:results].map do |member_data|
      Member.new(member_data)
    end
  end
end
