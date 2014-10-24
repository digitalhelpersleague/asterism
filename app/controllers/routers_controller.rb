class RoutersController < ApplicationController
  helper_method :routers, :router

  def show
    respond_to do |format|
      format.json
    end
  end

  def index
    @routers = Router.all
    respond_to do |format|
      format.json
      format.html do
        gon.rabl template: 'app/views/routers/index.rabl', as: :routers
      end
    end
  end

  def create
    @router = Router.create(router_params)
    json_responder
  end

  def update
    resource.update(router_params)
    json_responder
  end

  def destroy
    resource.destroy
    respond_to do |format|
      format.json { render json: {} }
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
    params.require(:router).permit(:context, :exten, :priority, :app, :appdata, { routes: [:exten, :priority] })
  end

end
