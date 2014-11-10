class ApplicationResponder < ActionController::Responder

  include Responders::FlashResponder
  include Responders::HttpCacheResponder
  include Responders::GonResponder

  # Redirects resources to the collection path (index action) instead
  # of the resource path (show action) for POST/PUT/DELETE requests.
  # include Responders::CollectionResponder
end
