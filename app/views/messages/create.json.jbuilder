json.avatar user_avatar(@message.talker)
json.nickname user_nickname(@message.talker)
json.body @message.body
json.created_at @message.created_at.strftime('%Y/%m/%d %H:%M')
json.id @message.id
