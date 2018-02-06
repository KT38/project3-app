require 'twitter_api'
require 'json'
require 'open-uri'


caption='testt'
media_id=955988837783691264

twitterAPI = TwitterAPI::Client.new({
  :consumer_key => 'HK9HeyHHfmjCuN5kJhcp6umMI',
  :consumer_secret => 'eKUe3rAfN42SDOhC38gbFYkNSQPqgrCMnap9q4fEGSasgqJNIl',
  :token => '867568515707920384-91KpKcF3QMIXqcsSWwVhez9JIkskXo8',
  :token_secret => 'CuVJC1j0McpvOtrN75E1oHaY7jWGND9vGeUsxbeYVTQyO'
})


sendImage = twitterAPI.statuses_update({
  'status' => caption,
  'media_ids' => media_id
})

status_id = JSON.parse(sendImage.body)['id_str']
p status_id
