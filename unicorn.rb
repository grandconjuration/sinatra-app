# set path to app that will be used to configure unicorn
# note the trailing slash in this example
@dir = "/Users/simonwhiteley/docs4all/sinatra-auth/"

worker_processes 2
working_directory @dir

timeout 30

# Specify path to socket unicorn listen to,
# we will use this in our nginx.conf later
listen "#{@dir}tmp/sockets/unicorn.sock", :backlog => 64

#listen 8081, :tcp_nopush => true

# Set process id path
pid "#{@dir}tmp/pid/unicorn.pid"

# Set log file paths
stderr_path "#{@dir}log/unicorn.stderr.log"
stdout_path "#{@dir}log/unicorn.stdout.log"
