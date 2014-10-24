class ErrorsController < ApplicationController

  def error_404
    @error_message = "Страница не найдена"
    render :error, status: 404
  end

  def error_500
    @error_message = "Опаньки!"
    render :error, status: 500
  end

end
