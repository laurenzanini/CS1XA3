# **CS1XA3 PROJECT03**
### *MACID: zaninil*

The purpose of this project was to create a social media-like site by completing the outlined objectives using the django template provided

##### **USAGE OF THE SERVER**
- To run this both locally and on the mac1xa3.ca server, one must install and activate Conda Environment with: **conda activate djangoenv**
- Next, one can run locally with: **python manage.py runserver localhost:8000**
- Finally, one can run on the mac1xa3.ca server with: **python manage.py runserver localhost:10116**
- I have created a variety of test users with unique usernames and passwords to test the server and showcase the functionality I have implemented. One can log in with the test users provided, or create an account that satisfies the signup requirements. The test usernames and passwords are as follows:

                 Username: Jack               Password: Banana_#123
                 Username: Lauren             Password: Pineapple123
                 Username: Connor             Password: Apple_#123
                 Username: Mikayla            Password: Strawberry123
                 Username: Jimmy              Password: Broccoli_#123
                 Username: Amanda             Password: Watermelon123
                 Username: Luke               Password: Onion_#123
                 Username: Mary               Password: Peppers123
                 Username: Ben                Password: Orange_#123
                 Username: Alex               Password: Grapes123
                 Username: Sarah              Password: Tomato_#123
                 Username: Max                Password: Carrot123
                 Username: TestUser           Password: Lettuce123

##### **OBJECTIVE 1: Complete Login and SignUp Pages**
**Description:** 
- This feature displayed the Login and Signup pages of the social media site being created. As the login form was already completed, I added a user object manually from the shell by following the directions provided in the objective. After this user has been created, I tested the login form. Next, Code was added to **Project03/login/views.py** in the function **def signup_view** and  **Project03/login/templates/signup.djhtml** to display a form for creating a new user. The function **def create_view** was defined and I implemented code to allow one to create a new user. This used the **UserCreationForm**. If the new user was successfully created, the user is automatically logged in and redirected to the Messages page.

**Exceptions:**
-  The exception in this feature is in the function **def create_view** the exception happens when a new user is not successfully created. If user creation is unsuccessful, the site redirects back to the Login page. 

 ##### **OBJECTIVE 2: Adding User Profile and Interests**
 **Description:**
 - This feature implements a real profile and interests that correspond the the currently logged in user. The file **Project03/social/templates/social_base.djhtml** was edited using Django Template Variables. The attributes available were provided in the *UserInfo class* in **Project03/social/models.py**. The file **social_base.djhtml** was updated with the information corresponding to the currently logged in user with the following attributes: username, employment, location, birthday, and interests (which are displayed as a list, so iterated through using a for loop).
 
**Exceptions:**
- No exceptions were implemented for Objective 2.

 ##### **OBJECTIVE 3: Account Settings Page**
 **Description:**
 - This feature allows the currently logged in user to change their password, and update their account information, the attributes being: employment, location, birthday and interests. The function **def account_view** in **Project03/social/views.py** and the template **Project03/social/templates/account.djhtml** were edited to complete this objective. The function was edited to include POST requests sent by the forms to change the authenticated user's account information. The template was edited to contain two forms. One to change the users password, and one to update the users information. When the password of the authenticated user is changed, the site will redirect to the People page. When the user information of the authenticated user is updated, the site will remain on the Account page, and the information will update in the left-hand panel. 
 
**Exceptions:**
- The exceptions in this feature are in the function **def account_view**. The first exception happens when a user is not authenticated. If user authentication is unsuccessful, the site redirects back to the Login page. Additionally, the second exception happens when changing the password of the currently logged in user is unsuccessful. The main reason for an unsuccessful password change is that the password is not strong enough, when changing passwords they should be as strong as the passwords provided for the test users. This exception results in the site refreshing and remaining on the Account page showing the Change Password form.

 ##### **OBJECTIVE 4: Displaying People List**
 **Description:**
 - This feature displays the People page rendered by the function **def people_view** in **Project03/social/views.py**, the template **Project03/social/templates/people.djhtml**, and the javascript code **Project03/social/static/people.js**. The purpose of this objective is to edit the function and template above to change the People page to only display those who are not friends with the currently logged in user, start by displaying one user at a time, increment the users displayed by one each time the *more* button is pressed, and lastly, to reset when the user logs out. In the function, to only display those who are not friends with the user, I first found all the users who are friends with the user and set that to a variable called *allFriends*, from there, I defined the variable *all_people* as the list of those not friends with the currently logged in user. I used **.exclude()** to exclude both those who are friends with the user, and the currently logged in user themself from this page. I then needed to create a session variable to keep track of how many people to display. I added that session variable to the login app and set it equal to 1 to indicate that only one person should be displayed again when the user logs out. I also incremented said session variable in the function **def more_ppl_view** in **Project03/social/views.py**, so that when the more button is pressed, one more person will be displayed each time. In the template, I used the *all_people* list to render actual people, I implemented a for loop to iterate through the list and display the usernames, employment, locations, and birthdays of those in the list. 
 
**Exceptions:**
- The exception in this feature are in the function **def people_view**. The exception happens when a user is not authenticated. If user authentication is unsuccessful, the site redirects back to the Login page.

 ##### **OBJECTIVE 5: Sending Friend Requests**
 **Description:**
 - The purpose of this objective is to get the feature to display the friend requests of the currently logged in user in the right column of the page. To implement this feature, the template **Project03/social/templates/people.djhtml** was edited to contain the user who sent the request. It was also edited to use the *friend_requests* list to render friend requests to the user. This was done with a for loop. **people.js** used the id to send the POST request to the function, and the template id contains the name of the user sending the request. The function **friend_request_view** in **Project03/social/views.py** was edited to handle the POST using the FriendRequest model, the entry I added to do so was *newRequest*. 
 
**Exceptions:**
- The exception in this feature are in the function **def friend_request_view**. The exception happens when a user is not authenticated. If user authentication is unsuccessful, the site redirects back to the Login page.

 ##### **OBJECTIVE 6: Accepting / Declining Friend Requests**
 **Description:**
 - The purpose of this feature is to accept and decline friend requests sent to the currently logged in user. The template **Project03/static/templates/people.djhtml** was edited so the id would contain the username of the person that sent the friend request. This was done for both the Accept and Decline button. The function **acceptDeclineRequest** in **people.js** was edited so that pushing either Accept or Decline buttons sends a POST to **accept_decline_view**
with the appropriate button id. This was done by copying the javascript code for the function **friendRequest**, and changing *frID* from friendRequest to *decision* to work for **acceptDeclineRequest**. Finally, **def accept_decline_view** in **Project03/social/views.py** was updated to handle the POST request, it also deletes the corresponding *FriendRequest* entry, and if the request was accepted it updates both friends relation in
the UserInfo table. 
 
**Exceptions:**
- The exception in this feature are in the function **def accept_decline_view**. The exception happens when a user is not authenticated. If user authentication is unsuccessful, the site redirects back to the Login page.

 ##### **OBJECTIVE 7: Displaying Friends**
 **Description:**
 - The purpose of this feature is to display all of the friends of the currently logged in user on the right column of the Messages page. The Messages page is rendered by the function **def messages_view** in **Project03/social/views.py**, the template **Project03/social/templates/messages.djhtml**, and the javascript code **Project03/social/static/messages.js**. To fulfill this objective I implemented a for loop in **messages.js** to iterative over the objects returned by all of the friends relation in the user_info variable. This displays all of the friends of the current user. 
 
**Exceptions:**
- No exceptions were implemented for Objective 7.

 ##### **OBJECTIVE 8: Submitting Posts**
 **Description:**
 - The purpose of this feature is to allow users to write and submit posts. The function **submitPost** has been edited in **essages.js** to submit a AJAX POST request when post-button is clicked, sending the *contents*
of post-text to **post_submit_view**. I isolated the contents by using *innerHTML*. The next part is to edit **def post_submit_view** in **Project03/social/views.py** to handle the post submission by adding a new entry to the Post model. 
**Exceptions:**
- The exception in this feature are in the function **def post_submit_view**. The exception happens when a user is not authenticated. If user authentication is unsuccessful, the site redirects back to the Login page.


 ##### **OBJECTIVE 9: Displaying Post List**
 **Description:**
 - The purpose of this feature is to display all posts submitted by all users, in order from newest to oldest. The feature should also start out by displaying one post, the most recent, and the amount of posts displayed should increment by one each time the *More* button is pressed. The template **Project03/social/templates/messages.djhtml** was edited to display Posts using posts lists. This was done by a for loop, in which iterated through posts. The function **messages_view** was edited to query for posts and sort posts by newest and to oldest. To do so, I used *order_by()* on the primary key, in which one could use *order_by("-id")* or *order_by("-timestamp")*. I then needed to create a session variable to keep track of how many posts to display. I added that session variable to the login app and set it equal to 1 to indicate that only one post should be displayed again when the user logs out. I also incremented said session variable in the function **def more_post_view** in **Project03/social/views.py**, so that when the more button is pressed, one more post will be displayed each time.
 
**Exceptions:**
- The exception in this feature are in the functions **messages_view** and **def more_post_view**. The exception happens when a user is not authenticated. If user authentication is unsuccessful, the site redirects back to the Login page.

 ##### **OBJECTIVE 10: Liking Posts (and Displaying Like Count)**
 **Description:**
 - The purpose of this feature is to allow users to like a post, allow the site to display a like-count, and prevent people from double liking a post. I was unsuccessful in completing this objective in the given time as I really struggled with this project.
 
**Exceptions:**
- I did not complete this objective.

 ##### **OBJECTIVE 11: Create a Test Database**
 **Description:**
 - The purpose of this objective was to create test users, posts, friend requests and likes to showcase the functionality I implemented. I created the test users that I outlined in the **Usage** section, and have updated account information, posts and friends for each of them.




