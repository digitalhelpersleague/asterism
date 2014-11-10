class RoutersController < ApplicationController
  respond_to :html, :json
  helper_method :routers, :router

  def index
    respond_with routers, gon: { rabl: { as: :routers }}
  end

  def show
    respond_with router, gon: { rabl: { as: :router }}
  end

  def create
    @router = Router.new(router_params)
    resource.save(raise_on_failure: false)
    respond_with router
  end

  def update
    resource.set(router_params)
    resource.save(raise_on_failure: false)
    respond_with router
  end

  def destroy
    if resource.destroy
      render nothing: true, status: 204
    else
      respond_with router
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
