class SipsController < ApplicationController
  respond_to :html, :json
  inherit_resources
  helper_method :sip, :sips

  def index
    gon.rabl template: 'app/views/sips/index.rabl', as: :sips
    index!
  end

  protected

  def sip
    SipDecorator.decorate resource
  end

  def sips
    SipDecorator.decorate_collection collection
  end

end
