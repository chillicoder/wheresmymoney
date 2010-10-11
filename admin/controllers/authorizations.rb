Admin.controllers :authorizations do

  get :index do
    @authorizations = Authorization.all
    render 'authorizations/index'
  end

  get :new do
    @authorization = Authorization.new
    render 'authorizations/new'
  end

  post :create do
    @authorization = Authorization.new(params[:authorization])
    if @authorization.save
      flash[:notice] = 'Authorization was successfully created.'
      redirect url(:authorizations, :edit, :id => @authorization.id)
    else
      render 'authorizations/new'
    end
  end

  get :edit, :with => :id do
    @authorization = Authorization.find(params[:id])
    render 'authorizations/edit'
  end

  put :update, :with => :id do
    @authorization = Authorization.find(params[:id])
    if @authorization.update_attributes(params[:authorization])
      flash[:notice] = 'Authorization was successfully updated.'
      redirect url(:authorizations, :edit, :id => @authorization.id)
    else
      render 'authorizations/edit'
    end
  end

  delete :destroy, :with => :id do
    authorization = Authorization.find(params[:id])
    if authorization.destroy
      flash[:notice] = 'Authorization was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Authorization!'
    end
    redirect url(:authorizations, :index)
  end
end