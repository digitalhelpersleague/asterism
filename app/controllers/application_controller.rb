class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Sequel::RecordNotFound do
    @error_message = '404'
    render template: 'errors/error', status: 404
  end

  private

  def collection_responder(opts = { formats: [:json] })
    respond_to do |format|
      opts[:formats].each do |fmt|
        format.send(fmt) do
          opts[:gon] && fmt == :html && gon.rabl(opts[:gon])
        end
      end
    end
  end

  def resource_responder(opts = { formats: [:json] })
    respond_to do |format|
      opts[:formats].each do |fmt|
        format.send(fmt)
      end
    end
  end

  def error_responder(opts = { formats: [:json] })
    respond_to do |format|
      opts[:formats].each do |fmt|
        format.send(fmt) do
          if fmt == :json
            render json: { errors: resource.errors.full_messages.to_json },
                   status: 422
          end
        end
      end
    end
  end
end
