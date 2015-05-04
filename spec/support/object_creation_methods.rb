def create_user(options={})
  defaults = {username: "Alan Shore", password: "you bumptious moron"}

  User.create!(defaults.merge(options))
end
