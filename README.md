this a prototype of the car-pooling app you can find at raye7.com

There are four main models:
1- User with devise authentication.
2- Pickup for user of type passenger.
3- Trip for user of type driver.
4- Place to specify source and destination of trips and pickups.


There are the common authentication routes that devise provides for user login, signup, etc.
I modified user signup form to account for missing fields needed by user.


The rest of the routes are scoped under v1 for version 1 of the API.

There are 3 main controllers:
1- Users that features only #show because user creation is already provided by devise.
2- Trips that features both #create and #destroy.
3- Pickup that features both #create and #destroy

Future Work:
1- Improving the test suite.

2- I thought about merging the Trip and Pickup model into an abstracted layer featuring common into a higher level class like this https://stackoverflow.com/questions/14088768/implementing-abstract-base-model-class-the-rails-way but I decided against it since I would imagine the matcher between pickup and trip doesn't match exact coordinates but rather works in an area around the pickup point a passenger chooses so, the pickup and trip wouldn't match in the beginning. Maybe they would match later on though.

3- Maps integration. Unforunately, the trip/pickup forms accept a destination/source id as places which is definitely highly impractical but it did the job for this prototype though. I would like to add maps integration so, the passenger/driver can add a source and destination they want.
