class ExtensionsController < ApplicationController
  respond_to :json
  helper_method :extensions

  def search
    @extensions = Extension.find_by_context(params[:q])
    respond_with extensions
  end

  protected

  def collection
    @extensions ||= Extension.all
  end

  def extensions
    collection
  end
end
