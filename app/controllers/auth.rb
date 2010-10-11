Wheresmymoney.controllers :auth do
  get :index do
    render "auth/index"
  end

  get :callback, :map => "/auth/:provider/callback" do
    auth = request.env["rack.auth"]

    unless @auth = Authorization.find_from_hash(auth)
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      @auth = Authorization.create_from_hash(auth, current_account)
    end

    current_account = @auth.account if current_account.nil?

    set_current_account(current_account)
    redirect url(:base, :index)
  end
end
