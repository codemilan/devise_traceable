# After each sign in, sign out.
# This is only triggered when the user is explicitly set (with set_user)
# and on authentication. Retrieving the user from session (:fetch) does
# not trigger it.

Warden::Manager.after_set_user do |record, warden, opts|
  if record.respond_to?(:track_login!)
    record.track_login!
  end
end

