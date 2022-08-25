# copyright: 2022, Scott Russell

title "List local users of Automate via an API call"

# you add controls here
control "list local users 001" do           # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title "List all local users in a given Automate instance"             # A human-readable title
  desc "keep an eye on who your local users are,and if any new ones appear, raise a flag"
  describe automate(url:'https://automate.local.success.chef.co') do                  # The actual test
    its ( 'usernames' )  { should include 'Scott' }
    its ( 'usernames' )  { should include 'Local Administrator'}
    its ( 'usernames.size' )  { should be <=2 }
  end
end