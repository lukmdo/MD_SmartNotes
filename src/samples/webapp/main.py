#!/usr/bin/env python

import wsgiref.handlers
from google.appengine.ext import db
from google.appengine.ext import webapp
from google.appengine.ext.webapp import template
 
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

def main():
  application = webapp.WSGIApplication([('/', MainHandler)],
                                       debug=True)
  wsgiref.handlers.CGIHandler().run(application)

if __name__ == '__main__':
  main()
