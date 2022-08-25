# automateapi
Example InSpec Profile to connect to Chef Automate API using inspec to test that local users exist

This example shows the implementation of an InSpec profile that will 
connect to a given chef automate instance using a token, and retrieve
a list of local users, which it can then compare to the usernames in 
the inspec control. 

Run this locally

inspec exec automateapi

Sample output

 ✔  list local users 001: List all local users in a given Automate instance
     ✔  automate usernames is expected to include "Scott"
     ✔  automate usernames is expected to include "Local Administrator"
     ✔  automate usernames.size is expected to be <= 2