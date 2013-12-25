#
# * GET home page.
#
exports.index = (req, res) ->
  res.render "index"

exports.angular = (req, res) ->
  route = req.params.route
  name = req.params.name
  res.render "angular/" + route + "/" + name
