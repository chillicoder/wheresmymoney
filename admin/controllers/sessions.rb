Admin.controllers :sessions do

  get :new do
    if logged_in?
      redirect url(:base, :index)
    else
      render "/sessions/new", nil, :layout => false
    end
  end

  post :create do
    if account = Account.authenticate(params[:email], params[:password])
      set_current_account(account)
      redirect url(:base, :index)
    else
      flash[:warning] = "Login or password wrong."
      redirect url(:sessions, :new)
    end
  end

  get :destroy do
    set_current_account(nil)
    redirect url(:sessions, :new)
  end

  get :language do
    if I18n.locale == :es
      I18n.locale = :en
    else
      I18n.locale = :es
    end

    redirect url(:base, :index)
  end
end
