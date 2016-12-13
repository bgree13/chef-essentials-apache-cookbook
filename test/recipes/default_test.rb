# # encoding: utf-8

# Inspec test for recipe apache::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

unless os.windows?
  describe user('root') do
    it { should exist }
    #skip 'This is an example test, replace with your own test.'
  end
end

describe port(80) do
  it { should be_listening }
  #skip 'This is the webserver port test.'
end

describe file('/var/www/html/index.html') do
  its('content') { should match /\<h1\>Hello, World\<\/h1\>/ }
  #skip 'This is the index.html test.'
end

describe file('/var/www/html/index.html') do
  it { should be_readable.by_user('apache') }
  it { should be_writable }
end
