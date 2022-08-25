# automateapi
Example InSpec Profile to connect to Chef Automate API using inspec to test that local users exist

This example shows the implementation of an InSpec profile that will 
connect to a given chef automate instance using a token, and retrieve
a list of local users, which it can then compare to the usernames in 
the inspec control. 


Run this locally

`inspec exec automateapi`

Don't forget to export your api token
eg 
```
export AUTOMATE_TOKEN=<myautomatetokenshouldbehere>
```


Sample output
```
   ✔  list local users 001: List all local users in a given Automate instance
    ✔  automate usernames is expected to include "Scott"
    ✔  automate usernames is expected to include "Local Administrator"
    ✔  automate usernames.size is expected to be <= 2
```

Alternatively, to validate your environment, you can also run this simply using bash and curl, see below:- 

```
#!/usr/bin/bash
TOKEN=<replacemewithyourtoken>
curl -v -k -X GET https://automate.local.success.chef.co/apis/iam/v2/users \
-H "api-token: $TOKEN" \
-H 'Content-Type: application/json' \
-d '{"output_type": "json"}' > ./listlocalusers.txt
```
