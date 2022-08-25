# Author: Scott Russell

require 'httpclient'

class Connection < Inspec.resource(1)
  name 'automate'
  desc 'Connects to the automte api(s) and downloads the local user list'

  def initialize(opts = {})
    @opts = opts # Store the opts for later use
    # return fail_resource "Must use named parameters (eg name:'bobo')" unless @opts.is_a? Hash
    # return fail_resource 'Must provide :name param' unless @opts.keys.include? :url
  end

  def usernames
    # take the list_all_local_users and turn it into an array of names of users 
    # so the control chan check for actual usernames
    # change from a hash of an array of hashes, to an array of hashes
    puts " into usernames method"
    list_all_local_users
    @userlist=@list_all_local_users["users"]
    # now extract the "name" field from the array of hashes, ie all usernames
    @usernames=@userlist.map {|x| x["name"]}
  end

  def list_all_local_users
    api_token ||= ENV['AUTOMATE_TOKEN'] 
    # you should supply this variable in your env
    # docs on how to get an API token for an automate instance here:
    # https://docs.chef.io/automate/api_tokens/
    # docs are here for this particular method
    # https://docs.chef.io/automate/api/#tag/users/operation/Users_ListUsers
    @list_all_local_users ||= JSON.parse(inspec.http("#{@opts[:url]}/apis/iam/v2/users",headers: {'Content-Type': 'application/json', 'api-token': "#{api_token}"}, ssl_verify: false).body)
  end
end