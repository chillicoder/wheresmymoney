Admin.controllers :money do

  get :index do
    @money = Money.find_all_by_account_id(@current_account.id)
    render 'money/index'
  end

  get :new do
    @money = Money.new
    render 'money/new'
  end

  post :create do
    @money = Money.new(params[:money])
    # Relate the money to the current user unless another account was specified
    @money.account = @current_account if @money.account_id.nil?

    if @money.save
      flash[:notice] = 'Money was successfully created.'
      redirect url(:money, :edit, :id => @money.id)
    else
      render 'money/new'
    end
  end

  get :edit, :with => :id do
    @money = Money.find(params[:id])
    render 'money/edit'
  end

  put :update, :with => :id do
    @money = Money.find(params[:id])
    if @money.update_attributes(params[:money])
      flash[:notice] = 'Money was successfully updated.'
      redirect url(:money, :edit, :id => @money.id)
    else
      render 'money/edit'
    end
  end

  delete :destroy, :with => :id do
    money = Money.find(params[:id])
    if money.destroy
      flash[:notice] = 'Money was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Money!'
    end
    redirect url(:money, :index)
  end
end
