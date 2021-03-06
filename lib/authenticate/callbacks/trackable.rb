# Update all standard tracked stats at each authentication.
Authenticate.lifecycle.after_authentication name: 'trackable' do |user, session, _options|
  if user && user.respond_to?(:update_tracked_fields!)
    user.update_tracked_fields!(session.request)
  end
end
