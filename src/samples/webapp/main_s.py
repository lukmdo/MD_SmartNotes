class Logs(db.Model):
  entry = db.StringProperty(required=True)
  datetime = db.TimeProperty(auto_now_add=True)

class MainHandler(webapp.RequestHandler):
  def get(self):
    logs = Logs.gql('ORDER BY datetime DESC LIMIT 3')
    self.response.out.write(
      template.render('main.html', {'logs': logs}))
  def post(self):
    log = Logs(entry=self.request.get('entry'))
    log.put()
    self.redirect('/')

application = webapp.WSGIApplication([('/', MainHandler)])
