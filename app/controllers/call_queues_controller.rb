class CallQueuesController < ApplicationController
  respond_to :html, :json
  helper_method :call_queues, :call_queue

  def index
    respond_with call_queues, gon: { rabl: { as: :call_queues }}
  end

  def show
    respond_with call_queue, gon: { rabl: { as: :call_queue }}
  end

  def create
    @call_queue = CallQueue.new(call_queue_params)
    resource.save(raise_on_failure: false)
    respond_with call_queue
  end

  def update
    resource.set(call_queue_params)
    resource.save(raise_on_failure: false)
    respond_with call_queue
  end

  def destroy
    if resource.destroy
      render nothing: true, status: 204
    else
      respond_with call_queue
    end
  end

  protected

  def collection
    @call_queues ||= CallQueue.all
  end

  def resource
    @call_queue ||= CallQueue.find!(id: params[:id])
  end

  def call_queues
    collection
  end

  def call_queue
    resource
  end

  private

  def call_queue_params
    params.require(:call_queue)
      .permit :context, :exten, :priority, :app, :appdata
  end
end
