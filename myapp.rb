require "roda"
require "sequel"

database = "myapp_development"
user = "postgres"
password = "point"
DB = Sequel.connect(adapter: "postgres", database: database,
                    host: "localhost", user: user, password: password)

class Myapp < Roda
  plugin :static, ["/images", "/css", "/js"]
  plugin :render
  plugin :head


  route do |r|
    r.root do
      view("homepage")
    end

    r.get "about" do
      view("about")
    end

    r.get "contact" do
      view("contact")
    end
  end
end
