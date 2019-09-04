amy = User.create(name: "Amy", email: "amy@amy.com", password: "ninja")
emily = User.create(name: "Emily", email: "emily@emily.com", password: "ninja")

SuggestionEntry.create(content: "I suggest that we have a weekly team meeting", user_id: amy.id)
amy.suggestion_entries.create(content: "I suggest that we add the remote agents to the main contact page")

emily_entry = emily.suggestion_entries.build(content: "I suggest that we buy one more coffee maker!")
emily_entry.save 
