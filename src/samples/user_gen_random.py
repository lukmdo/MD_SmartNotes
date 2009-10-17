def __gen_random(self, size=30):
  return ''.join(random.sample(string.letters+string.digits+string.pupunctuation, size))
    
def get_activation_key(self):
  if not self.password:
    self.password = unicode(self.__gen_random())
    self.save()     
  extra_args = {}
  activation_key = (str(self.key()), self.password, extra_args)
  return base64.encodestring(cPickle.dumps(activation_key))        
