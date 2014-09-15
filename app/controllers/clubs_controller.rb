class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]

  # GET /clubs
  # GET /clubs.json
  def index
    @clubs = Club.all
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show

    
    @hash = Gmaps4rails.build_markers(@club) do |club, marker|
      marker.lat club.latitude
      marker.lng club.longitude
end
        #Load facebook.yml info
        config = YAML::load(File.open("#{Rails.root}/config/facebook.yml"));

       #Instantiate a new application with our app_id so we can get an access token
       my_app = FbGraph::Application.new(config['production']['app_id']);
       acc_tok = my_app.get_access_token(config['production']['client_secret']);

       #Instantiate a new page class using the page_id specified 
       @page = FbGraph::Page.new(config['production']['page_id'], :access_token => acc_tok).fetch;

               #Get wall posts
       @wall = FbGraph::Page.new(config['production']['page_id'], :access_token => acc_tok).posts;






       #Grab the events from the page 
       events = @page.events.sort_by{|e| e.start_time};

       #Grab the picture from the page 
       picture = @page.picture;

      

     
       #Get the events that are upcoming
       @upcoming_events = events.find_all{|e| e.start_time >= Time.now};

        #Get the picture
       @fbpic = picture;

       #Get the events that have passed
       @past_events = events.find_all{|e| e.start_time < Time.now}.reverse;
  end

  # GET /clubs/new
  def new
    @club = Club.new
  end

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs
  # POST /clubs.json
  def create
    @club = Club.new(club_params)

    respond_to do |format|
      if @club.save
        format.html { redirect_to @club, notice: 'Club was successfully created.' }
        format.json { render action: 'show', status: :created, location: @club }
      else
        format.html { render action: 'new' }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: 'Club was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubs_url }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:name, :phone, :address, :wait, :avatar)
    end
end
