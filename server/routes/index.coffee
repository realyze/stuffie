require 'express-resource'

exports.setup = (app) ->
  app.get '/', (req, res) ->
    res.render 'index', 
      title: 'Stuffy'
      diff_left: 'fodwfwsfw'
      diff_right: 'something on the right side'

  
