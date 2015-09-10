class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
  end

  def edit
    @campaign = Campaign.find(params[:id])    
  end

  def update
    @campaign = Campaign.find(params[:id])

    if @campaign.update_attributes(campaign_params)
      flash[:notice] = "Campaign was updated."
      redirect_to campaigns_path
    else
      flash[:error] = "There was an error updating the campaign. Please try again."
      render :edit
    end    
  end

  def create
    @campaign = Campaign.new(campaign_params)    

    if @campaign.save
      flash[:notice] = "Campaign was saved."
      redirect_to campaigns_path
    else
      flash[:error] = "There was an error saving the campaign. Please try again."
      render :new
    end    
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    title = @campaign.title

    if @campaign.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @campaign
    else
      flash[:error] = "There was an error deleting the campaign. Please try again."
      render :show
    end    
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title)
  end

end
