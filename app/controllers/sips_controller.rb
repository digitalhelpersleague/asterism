class SipsController < ApplicationController
  helper_method :sip, :sips

  def index
    respond_to do |format|
      format.json
      format.html do
        gon.rabl template: 'app/views/sips/index.rabl', as: :sips
      end
    end
  end

  def show
    respond_to do |format|
      format.json
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
    params.require(:sip).permit(:callerid, :context, :name, :secret,
                                :dtmfmode, #:channel,
                                :number, :permit, :deny, :allow, :'call-limit')
  end
end
