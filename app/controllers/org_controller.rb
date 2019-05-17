class OrgController < ApplicationController

  def index
    @orgs = Org.all
  end

  def create

      # Parameter that are obligatory to be passed and the ones that are optional
      @org = Org.new(org_params)

      if @org.save
        redirect_to @org
        return
      end

      @errors = @org.errors.full_messages
      render :new # views/new.html.haml
  end

  def edit
    @org = Org.find(params[:id])
  end

  # Update the database
  def update

    @org = Org.find(params[:id])

    if @org.update_attributes(org_params)  
      # Handle a successful update.
      redirect_to @org
        
    else
      render 'edit'
    end
  end

  # Showed when user is created
  def show
    @org = Org.find(params[:id])
  end
  
  private

    def org_params
        params
        .require(:org) # filters
        .permit(:nome,
                :email,
                :instituto,
                :curso,
                :info,
                :foto,
                :link_site,
                :link_fb,
                :link_tt)
    end
end
