Problem Statement:
	You are suppose to create a Ruby on Rails 3 Image sharing app. Users will be able to sign up on the website via their email address and create their own personal albums. They can upload upto 25 images per album. Users can create any number of albums. Images uploaded by users would also be visible on the home page of the website. All users/visitors can browse any album.

	Album would have following properties: Name of the Album, Created Date, Owner
	Photos would have following properties: Image, Tag line for photo, Created date and owner

	The home page of the website will simply display the last 25 images uploaded and who uploaded it.

	User propfile page will display all the albums by that user.
	

Clone App and run bundle:
	git clone https://github.com/anidhya/parity-cube-assignment.git
	bundle
	
Gems used:
	'pg' - postgresql database
	'devise' - authentication
	'carrierwave' - image uploads
	'twitter-bootstrap-rails' - twitter bootstrap UI
	

	* All the non existing urls are redirected to the root page
	* Callback and validation confirm that there can be only 25 uploads for an album.

