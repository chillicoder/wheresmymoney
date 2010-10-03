Wheresmymoney.controllers  :base do

  get :index, :map => "/" do
    redirect "/admin/"
  end
end
