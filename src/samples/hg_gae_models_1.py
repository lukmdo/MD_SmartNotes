class Repository(db.Model):
    name = db.StringProperty(required=True)
    owner = db.ReferenceProperty(User, required=True)
    is_public = db.BooleanProperty(default=False)
    description = db.TextProperty()
    last_modified = db.IntegerProperty(default=0)
    
class UserRepository(db.Model):
    user = db.ReferenceProperty(User,
                                required=True,
                                collection_name='repos') 
    repo = db.ReferenceProperty(Repository,
                                required=True,
                                collection_name='users')

