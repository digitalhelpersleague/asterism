class SipsController < ApplicationController
  respond_to :html, :json
  helper_method :sip, :sips

  def index
    respond_with sips, gon: { rabl: { as: :sips }}
  end

  def show
    respond_with sip, gon: { rabl: { as: :sip }}
  end

  def create
    @sip = Sip.new(sip_params)
    resource.save(raise_on_failure: false)
    respond_with sip
  end

  def update
    resource.set(sip_params)
    resource.save(raise_on_failure: false)
    respond_with sip
  end

  def destroy
    if resource.destroy
      render nothing: true, status: 204
    else
      respond_with sip
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
