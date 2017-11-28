module Admin
  class SalesController < Fae::BaseController
    before_action :adjust_enum, only: [:create, :update]
    
    def adjust_enum
      params[:sale][:status] = params[:sale][:status].to_i
    end
  end
end
