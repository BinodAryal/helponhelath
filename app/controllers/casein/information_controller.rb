# Scaffolding generated by Casein v5.0.0.0

module Casein
  class InformationController < Casein::CaseinController
  
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
  
    def index
      @casein_page_title = 'Information'
  		@information = Information.order(sort_order(:title)).paginate :page => params[:page]
    end
  
    def show
      @casein_page_title = 'View information'
      @information = Information.find params[:id]
    end
  
    def new
      @casein_page_title = 'Add a new information'
    	@information = Information.new
    end

    def create
      @information = Information.new information_params
    
      if @information.save
        flash[:notice] = 'Information created'
        redirect_to casein_information_index_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new information'
        render :action => :new
      end
    end
  
    def update
      @casein_page_title = 'Update information'
      
      @information = Information.find params[:id]
    
      if @information.update_attributes information_params
        flash[:notice] = 'Information has been updated'
        redirect_to casein_information_index_path
      else
        flash.now[:warning] = 'There were problems when trying to update this information'
        render :action => :show
      end
    end
 
    def destroy
      @information = Information.find params[:id]

      @information.destroy
      flash[:notice] = 'Information has been deleted'
      redirect_to casein_information_index_path
    end
  
    private
      
      def information_params
        params.require(:information).permit(:title, :body, :image_url)
      end

  end
end