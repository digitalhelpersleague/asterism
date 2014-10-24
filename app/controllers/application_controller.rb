class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Sequel::RecordNotFound do
    @error_message = '404'
    render template: 'errors/error', status: 404
  end

  private

  def json_responder
    respond_to do |format|
      format.json do
        if resource.errors.any?
          return render(json:
            { error: resource.errors.messages.map do |k, v|
                "#{ k } #{ v.join(', ') }"
              end.join('; ')
            },
            status: 403
            )
        end
        render :show
      end
    end
  end
end
