class StocksController < ApplicationController
  # GET /stocks
  # GET /stocks.json
  def index
    @user = User.find(session[:user_id])
    @stocks = @user.stocks

    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
    @user = User.find(session[:user_id])
    @stock = Stock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stock }
    end
  end

  # GET /stocks/new
  # GET /stocks/new.json
  def new
    @user = User.find(session[:user_id])
    @stock = Stock.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end

  # GET /stocks/1/edit
  def edit
    @user = User.find(session[:user_id])
    @stock = Stock.find(params[:id])
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @user = User.find(session[:user_id])
    @stock = Stock.new(params[:stock])

    # another format I could have used to avoid the hidden user_id field in the view, use:
    # @stock = current_user.stocks.build(params[:stock])
    # @stock.save

    respond_to do |format|
      if @stock.save

        @stocks = @user.stocks
        format.html { redirect_to @stock, notice: 'Stock was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.js
      end
    end
  end

  # PUT /stocks/1
  # PUT /stocks/1.json
  def update
    @stock = Stock.find(params[:id])

    respond_to do |format|
      if @stock.update_attributes(params[:stock])
        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy

    respond_to do |format|
      format.html { redirect_to user_stocks_url }
      format.json { head :no_content }
    end
  end
end
