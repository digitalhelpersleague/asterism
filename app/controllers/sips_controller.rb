class SipsController < ApplicationController
  helper_method :sip, :sips

  def index
    collection_responder(
      formats: [:html, :json],
      gon: { template: 'app/views/sips/index.rabl', as: :sips }
    )
  end

  def show
    resource_responder
  end

  def create
    @sip = Sip.new(sip_params)
    begin
      resource.save
      resource_responder
    rescue
      error_responder
    end
  end

  def update
    begin
      resource.update(sip_params)
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
    params.require(:sip)
      .permit(:callerid, :name, :secret, :dtmfmode, :number,
        :fullname, :permit, :deny, :allow, :'call-limit')
  end
end
