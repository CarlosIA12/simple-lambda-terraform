HI!

This is just a simple terraform project done as a practice that creates 
a lambda triggered by an s3 bucket.

The module only requires two inputs: the name of the bucket to create and the environment name
evrything else derived from there; imagining a scenario where this type of infrastructure 
is commonly requested and needs to be compliant with company policies, so those configurations
are abstracted away from the user applying the template.

Internally it uses two modules, one from the registry and one created locally 
to test how to do either

Configurations applied:
The s3 bucket has server side encryption, object versioning activated, and a lifecylce policy
to deal with non current objects, they transition into One zone IA after 30 days 
of being an old version and are deleted after 180 days in there.

The lambda is python3.9, contains the necessary policies to be invoked by the bucket created 
in the same template.

the code is located in the same repo under se "src" folder.