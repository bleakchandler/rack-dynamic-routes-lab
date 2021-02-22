class Application

    @@items = [Item.new("Apples", 1.00),
        Item.new("Carrots",2.00),
        Item.new("Pears",3.00)]
  
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

      if req.path.match(/items/)
        grocery_item = req.path.split("/items/").last 
        searched_item = @@items.find{|i| i.name == grocery_item}
        if searched_item == nil
            resp.write "Route not found"
            resp.status = 404
        else
            resp.write searched_item.price
        end
      end

      resp.finish
    end

  end
  
  
  