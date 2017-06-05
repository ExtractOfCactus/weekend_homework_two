class Party
  attr_reader :group

  def initialize(group)
    @group = group
  end

  def find_guest_by_name(guest_name)
   return @group.find {|guest| guest.name() == guest_name}
  end

end