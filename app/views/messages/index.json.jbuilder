if @new_messages.present?
  json.array! @new_messages do |new_message|
    json.nickname user_nickname(new_message.talker)
    json.created_at new_message.created_at.strftime('%Y/%m/%d %H:%M')
    json.body new_message.body
    json.id new_message.id
  end
end
