def show(request):
  logs = Logs.gql('ORDER BY datetime DESC LIMIT 3')
  return render_to_response('index.html', {"logs": logs})

def store(request):
  log = Logs(entry=request.POST['entry'])
  log.put()
  return HttpResponseRedirect('/show')
