class ItemsController < ApplicationController
    get '/items' do
        if logged_in?
          @items = Item.all
          erb :'items/items'
        else
          redirect to '/login'
        end
      end

      get '/items/new' do
        if logged_in?
          erb :'items/create_item'
        else
          redirect to '/login'
        end
      end
    
      post '/items' do
        if logged_in?
          if params[:name] == ""
            redirect to "/items/new"
          else
            @item = current_user.items.build(name: params[:name])
            if @item.save
              redirect to "/items"
            else
              redirect to "/items/new"
            end
          end
        else
          redirect to '/login'
        end
      end
end