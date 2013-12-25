module.exports = (app) ->
  home = getRoute("home")
  api = getRoute("api")
  app.get "/", home.index
  app.get "/angular/:route/:name", home.angular
  app.get "/api/name", api.name
  app.get "*", home.index

mapRoutes = (app, route_name) ->
  route = getRoute(route_name)
  route_name = "/" + route_name

  app.get route_name, route.index
  app.get route_name + "/new", route.new
  app.post route_name + "/new", route.create
  app.get route_name + "/:id/edit", route.edit
  app.put route_name + "/:id/edit", route.update
  app.del route_name + "/:id", route.destroy
  app.get route_name + "/:id", route.show

getRoute = (route_name) ->
  require "../routes/" + route_name
