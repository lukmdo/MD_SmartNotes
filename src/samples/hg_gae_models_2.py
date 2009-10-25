class ChangeLog(db.Model):
    hexdigest = db.StringProperty(required=True)
    user = db.ReferenceProperty(User, required=True)
    date = db.IntegerProperty(default=0)
    description = db.TextProperty()
    mnhexdigest = db.StringProperty(required=True)
    file_names = db.StringListProperty()
    branch = db.StringProperty(default="default")

class FileLog(db.Model):
    file_name = db.StringProperty(required=True)
    filelogdata = db.BlobProperty()
    repo = db.ReferenceProperty(Repository, 
                                required=True,
                                collection_name="filelogs")