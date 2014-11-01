class RoutersController < ApplicationController
  helper_method :routers, :router

  def index
    collection_responder(
      formats: [:html, :json],
      gon: { template: 'app/views/routers/index.rabl', as: :routers }
    )
  end

  def show
    resource_responder
  end

  def create
    @router = Router.new(router_params)
    begin
      resource.save
      resource_responder
    rescue
      error_responder
    end
  end

  def update
    begin
      resource.update(router_params)
      resource_responder
    rescue
      error_responder
    end
  end

  def destroy
    begin
      resource.destroy
      respond_to do |format|
        format.json { render nothing: true, status: 204 }
      end
    rescue
      error_responder
    end
  end

  protected

  def collection
    @routers ||= Router.all
  end

  def resource
    @router ||= Router.find!(id: params[:id])
  end

  def routers
    collection
  end

  def router
    resource
  end

  private

  def router_params
    params.require(:router)
      .permit(
        :context, :exten, :priority, :app, :appdata,
        { routes: [:exten, :priority] }
      )
  end

end
