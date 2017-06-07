module GroupsHelper
  def group_has?(message)
    truncate(message.last.body, length: 40) if message.present?
  end
end
