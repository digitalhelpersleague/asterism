class IvrsController < ApplicationController
  respond_to :html, :json
  helper_method :ivr, :ivrs

  def index
    respond_with ivrs, gon: { rabl: { as: :ivrs }}
  end

  def show
    respond_with ivr, gon: { rabl: { as: :ivr }}
  end

  def create
    @ivr = Ivr.new(ivr_params)
    resource.save(raise_on_failure: false)
    respond_with ivr
  end

  def update
    resource.set(ivr_params)
    resource.save(raise_on_failure: false)
    respond_with ivr
  end

  def destroy
    if resource.destroy
      render nothing: true, status: 204
    else
      respond_with ivr
    end
  end

  protected

  def collection
    @ivrs ||= Ivr.all
  end

  def resource
    @ivr ||= Ivr.find!(id: params[:id])
  end

  def ivr
    resource
  end

  def ivrs
    collection
  end

  private

  def ivr_params
    params.require(:ivr).permit(:context, :medium)
  end
end
