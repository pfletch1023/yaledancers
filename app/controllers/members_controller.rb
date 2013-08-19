class MembersController < ApplicationController
  
  respond_to :html, :json
  
  def index
    @members = Member.all
    respond_with @members.as_json(methods: [:small_url, :medium_url, :original_url])
  end
  
  def new
    @member = Member.new
  end
  
  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to members_path
    else
      render :new
    end
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(params[:member])
      redirect_to members_path
    else
      render :edit
    end
  end
  
end
