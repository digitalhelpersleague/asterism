class SipsController < ApplicationController
  respond_to :html, :json
  helper_method :sip, :sips

  def show
    respond_to do |format|
      format.json
    end
  end

  def index
    @sips = Sip.all
    respond_to do |format|
      format.json
      format.html do
        gon.rabl template: 'app/views/sips/index.rabl', as: :sips
      end
    end
  end

  def create
    @sip = Sip.create(sip_params)
    json_responder
  end

  def update
    resource.update(sip_params)
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
    @sips ||= Sip.all
  end

  def resource
    @sip ||= Sip.find!(id: params[:id])
  end

  def sip
    resource
  end

  def sips
    collection
  end

  private

  def sip_params
    params.require(:sip).permit(:context, :exten, :priority, :app, :appdata)
  end
end
